import Foundation

class StockHolding:NSObject {
	var	purchaseSharePrice: Float
	var currentSharePrice: Float
	var numberOfShares: Int
	var companyName: String

	//initializing the properitors
	init(purchaseSharePrice:Float,currentSharePrice:Float,numberOfShares:Int,companyName:String){
		self.purchaseSharePrice = purchaseSharePrice 
		self.currentSharePrice = currentSharePrice
		self.numberOfShares = numberOfShares
		self.companyName = companyName
	}

	//accessor methodes
	func getpurchaseSharePrice()->Float
	{
			return purchaseSharePrice
	}

	func getcurrentSharePrice()->Float
	{
			return 	currentSharePrice	
	}

	func getnumberOfShares()->Int
	{
			return numberOfShares
	}

	func getcompanyName()->String
	{
			return companyName
	}

	//to get the cost in dollars
	func costInDollars()->Float
	{
	 return purchaseSharePrice * Float(numberOfShares)
	}

	//to get the value in dollars
	func valueInDollars()->Float
	{
	 return currentSharePrice * Float(numberOfShares)
	}
			   
}

//Main

import Foundation
var stockHolding = [StockHolding]()

//inserting 10 instances

func insertData(){

	stockHolding.append(StockHolding(purchaseSharePrice:145.5,currentSharePrice:160.7,numberOfShares:20,companyName:"Agnico Eagle Mines"))
	stockHolding.append(StockHolding(purchaseSharePrice:188.0,currentSharePrice:195.9,numberOfShares:14,companyName:"Pollard Banknote"))
	stockHolding.append(StockHolding(purchaseSharePrice:189.5,currentSharePrice:170.2,numberOfShares:16,companyName:"Goeasy Ltd"))
	stockHolding.append(StockHolding(purchaseSharePrice:150.4,currentSharePrice:180.5,numberOfShares:26,companyName:"TFI International"))
	stockHolding.append(StockHolding(purchaseSharePrice:200.1,currentSharePrice:160.0,numberOfShares:30,companyName:"Shopify"))
    stockHolding.append(StockHolding(purchaseSharePrice:190.1,currentSharePrice:245.1,numberOfShares:9,companyName:"Nuvei"))
    stockHolding.append(StockHolding(purchaseSharePrice:390.3,currentSharePrice:195.1,numberOfShares:16,companyName:"Telus"))
    stockHolding.append(StockHolding(purchaseSharePrice:290.7,currentSharePrice:495.1,numberOfShares:56,companyName:"Parkland Fuels"))
    stockHolding.append(StockHolding(purchaseSharePrice:317.4,currentSharePrice:320.0,numberOfShares:36,companyName:"Brookfield Renewables"))
    stockHolding.append(StockHolding(purchaseSharePrice:117.4,currentSharePrice:220.0,numberOfShares:6,companyName:"Royal Banks"))
	
}

insertData()

// Display all the stocks sorted by company name in alphabetical order.

var names = [String]()
for sh in stockHolding{
    names.append(sh.getcompanyName())
}
names.sort()
print("Before adding the foreign stocks:")
for n in names{
    for sh in stockHolding{
    if(n == sh.getcompanyName()){
        print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares())")
        break
    }
    }
}
print("\n")
class ForeignStockHolding:StockHolding{
    private var conversionRate: Float
    
    	init(purchaseSharePrice:Float,currentSharePrice:Float,numberOfShares:Int,companyName:String,conversionRate:Float){
    	self.conversionRate = conversionRate
    	super.init(purchaseSharePrice:purchaseSharePrice, currentSharePrice:currentSharePrice, numberOfShares:numberOfShares, companyName:companyName)
	}
	
	func getConversionRate()->Float{
	    return conversionRate
	}
	
		//to get the cost in dollars
	override
	func costInDollars()->Float
	{
	 return (purchaseSharePrice*conversionRate) * Float(numberOfShares)
	}

	//to get the value in dollars
	override
	func valueInDollars()->Float
	{
	 return (currentSharePrice*conversionRate) * Float(numberOfShares)
	}
}

stockHolding.append(ForeignStockHolding(purchaseSharePrice:142.2,currentSharePrice:180.4,numberOfShares:15,companyName:"Apple", conversionRate:1.26))
stockHolding.append(ForeignStockHolding(purchaseSharePrice:65.8,currentSharePrice:110.0,numberOfShares:18,companyName:"Samsung",conversionRate:1.26))
	
print("After adding foreign stocks:")
names = [String]()
for sh in stockHolding{
    names.append(sh.getcompanyName())
}
var namesReverse = names.sorted().reversed()
for n in namesReverse{
    for sh in stockHolding{
    if(n == sh.getcompanyName()){
        if(sh is ForeignStockHolding){
            print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()), Conversion Rate: \((sh as! ForeignStockHolding).getConversionRate())")
            break
        }else{
           print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares())")
            break 
        }
        
    }
    }
}

print("\nEnter how many different stocks do you want to add:")
var numberStocks = Int(readLine()!)!
for _ in 1...numberStocks{
    print("Enter company name:")
    let sname = readLine()!
    let ssname = sname.capitalized


    print("Enter purchase price of stock:")
    let spurchase = Float(readLine()!)!
    print("Enter current price of stock:")
    let scurrent = Float(readLine()!)!
    print("Enter number of shares:")
    let sshares = Int(readLine()!)!
    print("Enter type of share (Enter f for foreign, anything else for ordinary share):")
    let stype = readLine()!
    
    if(stype == "f" || stype == "F"){
        print("Enter conversion rate of foreign stock:")
        let sconversion = Float(readLine()!)!
        stockHolding.append(ForeignStockHolding(purchaseSharePrice:spurchase,currentSharePrice:scurrent,numberOfShares:sshares,companyName:ssname, conversionRate:sconversion))
        print("Stock Added.")
    }else{
        stockHolding.append(StockHolding(purchaseSharePrice:spurchase,currentSharePrice:scurrent,numberOfShares:sshares,companyName:ssname))
        print("Stock Added.")
    }
}



print("\n1. Display stock information with the lowest value")
print("2. Display stock with the highest value")
print("3. Display the most profitable stock")
print("4. Display the least profitable stock")
print("5. List all stocks sorted by company name (A-Z)")
print("6. List all stocks sorted from the lowest value to the highest value")
print("7. Exit")
print("Enter the corresponding number to choose what to do:")

var answer = Int(readLine()!)!
while(answer != 7){
    if(answer == 1){
    var values = [Float]()
        for sh in stockHolding{
            values.append(sh.valueInDollars())
        }
        let lowest = values.min()
        for sh in stockHolding{
            if(sh.valueInDollars() == lowest){
                if(sh is ForeignStockHolding){
            print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()), Conversion Rate: \((sh as! ForeignStockHolding).getConversionRate()) \n")
            break
        }else{
           print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()) \n")
            break 
        }
            }
        }
    }else if(answer == 2){
    var values = [Float]()
        for sh in stockHolding{
            values.append(sh.valueInDollars())
        }
        let highest = values.max()
        for sh in stockHolding{
            if(sh.valueInDollars() == highest){
                if(sh is ForeignStockHolding){
            print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()), Conversion Rate: \((sh as! ForeignStockHolding).getConversionRate()) \n")
            break
        }else{
           print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()) \n")
            break 
        }
            }
        }
    }else if(answer == 3){

		var most = Float()
		var comp = String()
		 for sh in stockHolding{
            if((sh.valueInDollars()-sh.costInDollars()) >= Float(most)){
               most = sh.valueInDollars()-sh.costInDollars()
				comp = sh.getcompanyName()
				
			   }
		 }
     for sh in stockHolding{
		if(sh is ForeignStockHolding && sh.getcompanyName() == comp){
            print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()), Conversion Rate: \((sh as! ForeignStockHolding).getConversionRate()) \n")
            break
        }else if (sh.getcompanyName() == comp){
           print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()) \n")
            break 
        }
	      }

        
    }else if(answer == 4){
        	var most = Float()
		var comp = String()
		 for sh in stockHolding{
            if((sh.valueInDollars()-sh.costInDollars()) <= Float(most)){
               most = sh.valueInDollars()-sh.costInDollars()
				comp = sh.getcompanyName()
				
			   }
		 }
     for sh in stockHolding{
		if(sh is ForeignStockHolding && sh.getcompanyName() == comp){
            print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()), Conversion Rate: \((sh as! ForeignStockHolding).getConversionRate()) \n")
            break
        }else if (sh.getcompanyName() == comp){
           print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares()) \n")
            break 
        }
	      }

    }else if(answer == 5){
        var names = [String]()
        for sh in stockHolding{
            names.append(sh.getcompanyName())
        }
        names.sort()
        print("Before adding the foreign stocks:")
        for n in names{
            for sh in stockHolding{
            if(n == sh.getcompanyName()){
                print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares())")
                break
            }
            }
        }
        print("\n")
    }else if(answer == 6){
        var lowtohigh = [String:Float]()
           for sh in stockHolding{
			 lowtohigh.updateValue(sh.valueInDollars(), forKey:sh.getcompanyName())
                }

		let Ascending = lowtohigh.sorted(by: { $0.value < $1.value })

          for (n,_) in Ascending{
              for sh in stockHolding{
                if(n == sh.getcompanyName()){
                   print("Company: \(sh.getcompanyName()), Purchase Price: \(sh.getpurchaseSharePrice()), Current Price: \(sh.getcurrentSharePrice()), Quantity: \(sh.getnumberOfShares())")
                                                              }
			  }
		          }
    }else{
        print("Please enter a valid number.\n")
    }
    
print("1. Display stock information with the lowest value")
print("2. Display stock with the highest value")
print("3. Display the most profitable stock")
print("4. Display the least profitable stock")
print("5. List all stocks sorted by company name (A-Z)")
print("6. List all stocks sorted from the lowest value to the highest value")
print("7. Exit")
print("Enter the corresponding number to choose what to do:")
answer = Int(readLine()!)!
}

	
