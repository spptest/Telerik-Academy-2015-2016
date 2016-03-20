namespace Observer_pattern
{
    using System;

    public delegate void StockPriceChangedHandler(object sender, StockPriceChangedEventArgs e);

    public class ObservableStock
    {
        private double price;

        public ObservableStock(double price)
        {
            this.price = price;
        }

        public event StockPriceChangedHandler PriceChanged;

        public double Price
        {
            get
            {
                return this.price;
            }
            set
            {
                if (Math.Abs(this.price - value) > 0.001)
                {
                    this.price = value;
                    this.Notify();
                }
            }
        }

        private void Notify()
        {
            if (this.PriceChanged != null)
            {
                this.PriceChanged(this, new StockPriceChangedEventArgs(this));
            }
        }

    }
}
