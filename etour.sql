USE [master]
GO
/****** Object:  Database [etour]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE DATABASE [etour]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'etour', FILENAME = N'C:\Users\ASUS\etour.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'etour_log', FILENAME = N'C:\Users\ASUS\etour_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [etour] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [etour].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [etour] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [etour] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [etour] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [etour] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [etour] SET ARITHABORT OFF 
GO
ALTER DATABASE [etour] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [etour] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [etour] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [etour] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [etour] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [etour] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [etour] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [etour] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [etour] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [etour] SET  ENABLE_BROKER 
GO
ALTER DATABASE [etour] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [etour] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [etour] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [etour] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [etour] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [etour] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [etour] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [etour] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [etour] SET  MULTI_USER 
GO
ALTER DATABASE [etour] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [etour] SET DB_CHAINING OFF 
GO
ALTER DATABASE [etour] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [etour] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [etour] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [etour] SET QUERY_STORE = OFF
GO
USE [etour]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [etour]
GO
/****** Object:  Schema [etour]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE SCHEMA [etour]
GO
/****** Object:  Table [etour].[booking]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[booking](
	[Booking_Id] [int] IDENTITY(192,1) NOT NULL,
	[Bookingdate] [date] NOT NULL,
	[Cust_Id] [int] NOT NULL,
	[Package_Id] [int] NOT NULL,
	[Passangers] [int] NOT NULL,
	[Touramount] [real] NOT NULL,
	[Taxes] [real] NOT NULL,
	[Totalamount] [real] NOT NULL,
	[Flag] [int] NULL,
 CONSTRAINT [PK_booking_Booking_Id] PRIMARY KEY CLUSTERED 
(
	[Booking_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[cost]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[cost](
	[Cost_Id] [int] IDENTITY(37,1) NOT NULL,
	[Sectormaster_Id] [int] NULL,
	[Singleoccupancy] [real] NULL,
	[Twinperson] [real] NULL,
	[Triplesharing] [real] NULL,
	[Childwithparents] [real] NULL,
	[Childwithoutparents] [real] NULL,
	[Validfrom] [date] NULL,
	[Validto] [date] NULL,
 CONSTRAINT [PK_cost_Cost_Id] PRIMARY KEY CLUSTERED 
(
	[Cost_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[customer]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[customer](
	[Cust_Id] [int] IDENTITY(8,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Mobile] [nvarchar](100) NOT NULL,
	[Roles] [int] NOT NULL,
 CONSTRAINT [PK_customer_Cust_Id] PRIMARY KEY CLUSTERED 
(
	[Cust_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [customer$Email_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [customer$Mobile_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[hibernate_sequence]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[hibernate_sequence](
	[next_val] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[itinerary]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[itinerary](
	[Iternery_Id] [int] IDENTITY(200,1) NOT NULL,
	[Day] [nvarchar](500) NULL,
	[Startlocation] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[SectorMaster_Id] [int] NULL,
 CONSTRAINT [PK_itinerary_Iternery_Id] PRIMARY KEY CLUSTERED 
(
	[Iternery_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [etour].[passanger]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[passanger](
	[Pass_Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](max) NOT NULL,
	[Lastname] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Passport] [nvarchar](max) NULL,
	[Adharcard] [nvarchar](max) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Package_Id] [int] NOT NULL,
	[Customer_Id] [int] NOT NULL,
	[Cost] [decimal](18, 0) NOT NULL,
	[Pincode] [nvarchar](max) NULL,
	[Flag] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pass_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [etour].[roles]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[roles](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_roles_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[sector]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[sector](
	[Sectormaster_Id] [int] IDENTITY(61,1) NOT NULL,
	[Sector_Id] [nvarchar](10) NULL,
	[Subsector_Id] [nvarchar](10) NULL,
	[Sectorname] [nvarchar](50) NOT NULL,
	[Imgpath] [nvarchar](250) NOT NULL,
	[Flag] [smallint] NULL,
 CONSTRAINT [PK_sector_Sectormaster_Id] PRIMARY KEY CLUSTERED 
(
	[Sectormaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[tourpackage]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[tourpackage](
	[Package_Id] [int] IDENTITY(145,1) NOT NULL,
	[Package_Name] [nvarchar](150) NOT NULL,
	[Sectormaster_Id] [int] NULL,
	[Startdate] [date] NOT NULL,
	[Enddate] [date] NULL,
	[Tourdates] [date] NULL,
 CONSTRAINT [PK_tourpackage_Package_Id] PRIMARY KEY CLUSTERED 
(
	[Package_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [etour].[user_roles]    Script Date: 4/10/2022 4:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [etour].[user_roles](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_user_roles_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [FK_cost_SectorMaster_Id_idx]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE NONCLUSTERED INDEX [FK_cost_SectorMaster_Id_idx] ON [etour].[cost]
(
	[Sectormaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_itinerary_SectorMaster_Id_idx]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE NONCLUSTERED INDEX [FK_itinerary_SectorMaster_Id_idx] ON [etour].[itinerary]
(
	[SectorMaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_package_SectorMaster_Id_idx]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE NONCLUSTERED INDEX [FK_package_SectorMaster_Id_idx] ON [etour].[tourpackage]
(
	[Sectormaster_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FKh8ciramu9cc9q3qcqiv4ue8a6]    Script Date: 4/10/2022 4:17:16 PM ******/
CREATE NONCLUSTERED INDEX [FKh8ciramu9cc9q3qcqiv4ue8a6] ON [etour].[user_roles]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [etour].[booking] ADD  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Sectormaster_Id]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Singleoccupancy]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Twinperson]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Triplesharing]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Childwithparents]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Childwithoutparents]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Validfrom]
GO
ALTER TABLE [etour].[cost] ADD  DEFAULT (NULL) FOR [Validto]
GO
ALTER TABLE [etour].[customer] ADD  CONSTRAINT [DF_customer_Roles]  DEFAULT ((0)) FOR [Roles]
GO
ALTER TABLE [etour].[hibernate_sequence] ADD  DEFAULT (NULL) FOR [next_val]
GO
ALTER TABLE [etour].[itinerary] ADD  DEFAULT (NULL) FOR [Day]
GO
ALTER TABLE [etour].[itinerary] ADD  DEFAULT (NULL) FOR [Startlocation]
GO
ALTER TABLE [etour].[itinerary] ADD  DEFAULT (NULL) FOR [SectorMaster_Id]
GO
ALTER TABLE [etour].[passanger] ADD  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [etour].[roles] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [etour].[sector] ADD  DEFAULT (NULL) FOR [Sector_Id]
GO
ALTER TABLE [etour].[sector] ADD  DEFAULT (NULL) FOR [Subsector_Id]
GO
ALTER TABLE [etour].[sector] ADD  DEFAULT (NULL) FOR [Flag]
GO
ALTER TABLE [etour].[tourpackage] ADD  DEFAULT (NULL) FOR [Sectormaster_Id]
GO
ALTER TABLE [etour].[tourpackage] ADD  DEFAULT (NULL) FOR [Enddate]
GO
ALTER TABLE [etour].[tourpackage] ADD  DEFAULT (NULL) FOR [Tourdates]
GO
ALTER TABLE [etour].[cost]  WITH NOCHECK ADD  CONSTRAINT [cost$FK_cost_SectorMaster_Id] FOREIGN KEY([Sectormaster_Id])
REFERENCES [etour].[sector] ([Sectormaster_Id])
GO
ALTER TABLE [etour].[cost] CHECK CONSTRAINT [cost$FK_cost_SectorMaster_Id]
GO
ALTER TABLE [etour].[itinerary]  WITH NOCHECK ADD  CONSTRAINT [itinerary$FK_itinerary_SectorMaster_Id] FOREIGN KEY([SectorMaster_Id])
REFERENCES [etour].[sector] ([Sectormaster_Id])
GO
ALTER TABLE [etour].[itinerary] CHECK CONSTRAINT [itinerary$FK_itinerary_SectorMaster_Id]
GO
ALTER TABLE [etour].[tourpackage]  WITH NOCHECK ADD  CONSTRAINT [tourpackage$FK_package_SectorMaster_Id] FOREIGN KEY([Sectormaster_Id])
REFERENCES [etour].[sector] ([Sectormaster_Id])
GO
ALTER TABLE [etour].[tourpackage] CHECK CONSTRAINT [tourpackage$FK_package_SectorMaster_Id]
GO
ALTER TABLE [etour].[user_roles]  WITH CHECK ADD  CONSTRAINT [user_roles$FK6jc1cscwrvbr2paq0en10rdm8] FOREIGN KEY([user_id])
REFERENCES [etour].[customer] ([Cust_Id])
GO
ALTER TABLE [etour].[user_roles] CHECK CONSTRAINT [user_roles$FK6jc1cscwrvbr2paq0en10rdm8]
GO
ALTER TABLE [etour].[user_roles]  WITH NOCHECK ADD  CONSTRAINT [user_roles$FKh8ciramu9cc9q3qcqiv4ue8a6] FOREIGN KEY([role_id])
REFERENCES [etour].[roles] ([id])
GO
ALTER TABLE [etour].[user_roles] CHECK CONSTRAINT [user_roles$FKh8ciramu9cc9q3qcqiv4ue8a6]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.booking' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'booking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.cost' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.customer' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'customer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.hibernate_sequence' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'hibernate_sequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.itinerary' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'itinerary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.roles' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.sector' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'sector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.tourpackage' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'tourpackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'etour.user_roles' , @level0type=N'SCHEMA',@level0name=N'etour', @level1type=N'TABLE',@level1name=N'user_roles'
GO
USE [master]
GO
ALTER DATABASE [etour] SET  READ_WRITE 
GO
