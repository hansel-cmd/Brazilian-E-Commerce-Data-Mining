

CREATE TABLE CustomerDim (
  customer_key int NOT NULL IDENTITY(1,1),
  customer_id varchar(255) NOT NULL,
  customer_unique_id varchar(255) NOT NULL
);
GO

-- --------------------------------------------------------

--
-- Table structure for table `datedim`
--

CREATE TABLE DateDim (
  date_key int NOT NULL IDENTITY(1,1),
  full_date datetime NOT NULL,
  calendar varchar(255) NOT NULL,
  year int NOT NULL,
  quarter int NOT NULL,
  quarter_id varchar(255) NOT NULL,
  month_number int NOT NULL,
  month_name varchar(255) NOT NULL,
  month_name_abbr varchar(255) NOT NULL,
  day_of_month int NOT NULL,
  day_of_week int NOT NULL,
  day_name varchar(255) NOT NULL,
  day_name_abbr varchar(255) NOT NULL
);
GO

-- --------------------------------------------------------

--
-- Table structure for table `locationdim`
--

CREATE TABLE LocationDim (
  location_key int NOT NULL IDENTITY(1,1),
  location_zip_code_prefix varchar(255) NOT NULL,
  location_state varchar(255) NOT NULL,
  location_city varchar(255) NOT NULL,
  location_latitude varchar(255) NOT NULL,
  location_longitude varchar(255) NOT NULL,
  is_active smallint NOT NULL DEFAULT 1,
  eff_date date DEFAULT GETDATE(),
  end_date date DEFAULT NULL,
);
GO

-- --------------------------------------------------------

--
-- Table structure for table `productdim`
--

CREATE TABLE ProductDim (
  product_key int NOT NULL IDENTITY(1,1),
  product_id varchar(255) NOT NULL,
  product_name_en varchar(255) NOT NULL,
  product_name_pt varchar(255) NOT NULL,
  product_weight_g int NOT NULL,
  product_length_cm int NOT NULL,
  product_height_cm int NOT NULL,
  product_width_cm int NOT NULL,
  is_active smallint NOT NULL DEFAULT 1,
  eff_date date DEFAULT GETDATE(),
  end_date date DEFAULT NULL,
);
GO

-- --------------------------------------------------------

--
-- Table structure for table `transactionfact`
--

CREATE TABLE TransactionFact (
  customer_key int NOT NULL,
  customer_location_key int NOT NULL,
  order_date_key int NOT NULL,
  product_key int NOT NULL,
  seller_location_key int NOT NULL,
  estimated_delivery_date_key int NOT NULL,
  date_delivered_key int NOT NULL,
  seller_id varchar(255) NOT NULL,
  order_status varchar(255) NOT NULL,
  order_number varchar(255) NOT NULL,
  order_item_number int NOT NULL,
  review_score int NOT NULL,
  item_price numeric(10, 2) NOT NULL,
  freight_value numeric(10, 2) NOT NULL
);
GO

ALTER TABLE CustomerDim
  ADD PRIMARY KEY (customer_key);
GO
--
-- Indexes for table `datedim`
--
ALTER TABLE DateDim
  ADD PRIMARY KEY (date_key);
GO
--
-- Indexes for table `locationdim`
--
ALTER TABLE LocationDim
  ADD PRIMARY KEY (location_key);
GO

--
-- Indexes for table `productdim`
--
ALTER TABLE ProductDim
  ADD PRIMARY KEY (product_key);
GO