namespace Observer_pattern
{
    using System;

    class Program
    {
        static void Main()
        {
            ObservableStock stock = new ObservableStock(15.5);
            stock.Price = 18;

            stock.PriceChanged += ObserverbleStockPriceChange;
            stock.Price = 16;
            stock.Price = 17;

        }

        private static void ObserverbleStockPriceChange(object sender, StockPriceChangedEventArgs stockPriceChangedEvetArgs)
        {
            Console.WriteLine("Observable stock price changed event fired. New price: " + stockPriceChangedEvetArgs.Stock.Price);
        }
    }
}
