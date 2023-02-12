import StoreKit

typealias FetchCompletionHandler = (([SKProduct]) -> Void)
typealias PurchaseCompletionHandler = ((SKPaymentTransaction?) -> Void)


class Store: NSObject, ObservableObject {
    
    
    private let allProductIdentifiers = Set([
        "com.creator.Vibratee.unlockEverything"
    ])
    
    @Published var fetchedProducts = [SKProduct]()
    
    private var productsRequest: SKProductsRequest?
    private var fetchCompletionHandler: FetchCompletionHandler?
    private var purchaseCompletionHandler: PurchaseCompletionHandler?
    
    override init() {
        super.init()
        
        startObservingPaymentQueue()
        
        fetchProducts { products in
            print(products)
        }

    }
    
    private func startObservingPaymentQueue() {
        SKPaymentQueue.default().add(self)
    }

    
    private func fetchProducts(_ completion: @escaping FetchCompletionHandler) {
        guard self.productsRequest == nil else { return }
        
        fetchCompletionHandler = completion
        
        productsRequest = SKProductsRequest(productIdentifiers: allProductIdentifiers)
        productsRequest?.delegate = self
        productsRequest?.start()
        
    }
    
    private func buy(_ product: SKProduct,  completion: @escaping PurchaseCompletionHandler) {
        purchaseCompletionHandler = completion
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    

}

extension Store {

    func purchaseProduct(_ product: SKProduct) {
        startObservingPaymentQueue()
        
        buy(product) { _ in }
    }

    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

extension Store: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            var shouldFinishTransaction = false
            switch transaction.transactionState {

            case .purchased, .restored:
                UserDefaults.standard.set(true, forKey: "purchaseMade")
                shouldFinishTransaction = true
            case .failed:
                shouldFinishTransaction = true
            case .deferred, .purchasing:
                break
            @unknown default:
                break
            }

            if shouldFinishTransaction {
                SKPaymentQueue.default().finishTransaction(transaction)
                DispatchQueue.main.async {
                    self.purchaseCompletionHandler?(transaction)
                    self.purchaseCompletionHandler = nil
                }
            }

        }
    }


}


extension Store: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("Loaded list of products...")
        let loadedProducts = response.products
            
        let invalidProducts = response.invalidProductIdentifiers
        
        
        if loadedProducts.isEmpty {
            
            print("Could not load the product!")
            if !invalidProducts.isEmpty {
                print("Invalid product found: \(invalidProducts)")
            }
            productsRequest = nil
                      return
        }
        
        DispatchQueue.main.async {
            self.fetchedProducts = loadedProducts
            self.fetchCompletionHandler?(self.fetchedProducts)
            
            self.fetchCompletionHandler = nil
            self.productsRequest = nil
        }
    }
}

