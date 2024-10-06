/****** Object:  Table [dbo].[customer]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [smallint] NOT NULL,
	[home_store] [tinyint] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[customer_since] [date] NOT NULL,
	[loyalty_cardNumber] [nvarchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[birth_year] [smallint] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generations]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generations](
	[birth_year] [smallint] NOT NULL,
	[generation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_generations] PRIMARY KEY CLUSTERED 
(
	[birth_year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[outlet_id] [tinyint] NOT NULL,
	[transaction_date] [date] NOT NULL,
	[product_id] [tinyint] NOT NULL,
	[start_of_day] [tinyint] NOT NULL,
	[quantity_sold] [tinyint] NOT NULL,
	[waste] [tinyint] NOT NULL,
	[waste_percentage] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [tinyint] NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[sub_category] [nvarchar](50) NOT NULL,
	[product_type] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[product_description] [nvarchar](100) NOT NULL,
	[product_weight] [nvarchar](50) NOT NULL,
	[wholesale_price] [float] NOT NULL,
	[retail_price] [money] NOT NULL,
	[tax_exempt_yn] [bit] NOT NULL,
	[promo_yn] [bit] NOT NULL,
	[new_product_yn] [bit] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrders]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[transaction_id] [smallint] NOT NULL,
	[transaction_date] [date] NOT NULL,
	[transaction_time] [time](7) NOT NULL,
	[outlet_id] [tinyint] NOT NULL,
	[staff_id] [tinyint] NOT NULL,
	[customer_id] [smallint] NOT NULL,
	[instore_yn] [bit] NULL,
	[product_id] [tinyint] NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[unit_price] [float] NOT NULL,
 CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC,
	[transaction_date] ASC,
	[transaction_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salesOutlet]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salesOutlet](
	[outlet_id] [tinyint] NOT NULL,
	[outlet_type] [nvarchar](50) NOT NULL,
	[store_area_feet] [smallint] NOT NULL,
	[store_address] [nvarchar](50) NOT NULL,
	[store_city] [nvarchar](50) NOT NULL,
	[store_state_province] [nvarchar](50) NOT NULL,
	[store_telephone] [nvarchar](50) NOT NULL,
	[store_postal_code] [smallint] NOT NULL,
	[store_longitude] [float] NOT NULL,
	[store_latitude] [float] NOT NULL,
	[manager] [tinyint] NULL,
	[Neighorhood] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sales_outlet] PRIMARY KEY CLUSTERED 
(
	[outlet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salesTarget]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salesTarget](
	[outlet_id] [tinyint] NOT NULL,
	[year_month] [nvarchar](50) NOT NULL,
	[beans_goal] [smallint] NOT NULL,
	[beverage_goal] [smallint] NOT NULL,
	[food_goal] [smallint] NOT NULL,
	[merchandise_goal] [smallint] NOT NULL,
	[total_goal] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staff_id] [tinyint] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[start_date] [date] NOT NULL,
	[location] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_generations] FOREIGN KEY([birth_year])
REFERENCES [dbo].[generations] ([birth_year])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_generations]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_sales_outlet_1] FOREIGN KEY([home_store])
REFERENCES [dbo].[salesOutlet] ([outlet_id])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_sales_outlet_1]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_product]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_sales_outlet] FOREIGN KEY([outlet_id])
REFERENCES [dbo].[salesOutlet] ([outlet_id])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_sales_outlet]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesOrders_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_customer]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_product]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesOrders_salesOutlet_2] FOREIGN KEY([outlet_id])
REFERENCES [dbo].[salesOutlet] ([outlet_id])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_salesOutlet_2]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_SalesOrders_staff_1] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_staff_1]
GO
ALTER TABLE [dbo].[salesOutlet]  WITH CHECK ADD  CONSTRAINT [FK_sales_outlet_staff] FOREIGN KEY([manager])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[salesOutlet] CHECK CONSTRAINT [FK_sales_outlet_staff]
GO
ALTER TABLE [dbo].[salesTarget]  WITH CHECK ADD  CONSTRAINT [FK_sales targets_sales_outlet] FOREIGN KEY([outlet_id])
REFERENCES [dbo].[salesOutlet] ([outlet_id])
GO
ALTER TABLE [dbo].[salesTarget] CHECK CONSTRAINT [FK_sales targets_sales_outlet]
GO
USE [master]
GO
ALTER DATABASE [coffeeShopDb] SET  READ_WRITE 
GO
