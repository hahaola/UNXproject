USE [FashionShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accID] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[RoleID] [nvarchar](50) NULL,
	[StatusAcc] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[Category_id] [nvarchar](50) NOT NULL,
	[Category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmToken]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmToken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NOT NULL,
	[ConfirmAt] [datetime] NULL,
	[accID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ConfirmToken] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] NOT NULL,
	[accID] [nvarchar](50) NOT NULL,
	[Product_id] [nvarchar](50) NOT NULL,
	[Comment] [nchar](10) NULL,
	[Rating] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OID] [nvarchar](50) NOT NULL,
	[accID] [nvarchar](50) NULL,
	[total] [decimal](18, 1) NULL,
	[DateOrder] [datetime] NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DOID] [nvarchar](50) NOT NULL,
	[Product_id] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[total] [decimal](18, 1) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[DOID] ASC,
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Product_id] [nvarchar](50) NOT NULL,
	[image_product] [nvarchar](max) NULL,
	[Name_product] [nvarchar](50) NULL,
	[Category_id] [nvarchar](50) NULL,
	[price] [decimal](18, 1) NULL,
	[DateCreate] [datetime] NULL,
	[Stock] [bit] NULL,
	[rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roleDetail]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleDetail](
	[RoleID] [nvarchar](50) NOT NULL,
	[Name_Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist_detail]    Script Date: 7/5/2023 3:14:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist_detail](
	[Wishlist_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [nvarchar](50) NOT NULL,
	[DateAdd] [datetime] NULL,
	[AccID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Wishlist_detail] PRIMARY KEY CLUSTERED 
(
	[Wishlist_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[roleDetail] ([RoleID])
GO
ALTER TABLE [dbo].[ConfirmToken]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmToken_account] FOREIGN KEY([accID])
REFERENCES [dbo].[account] ([accID])
GO
ALTER TABLE [dbo].[ConfirmToken] CHECK CONSTRAINT [FK_ConfirmToken_account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_account] FOREIGN KEY([accID])
REFERENCES [dbo].[account] ([accID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[product] ([Product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([accID])
REFERENCES [dbo].[account] ([accID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([Product_id])
REFERENCES [dbo].[product] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([DOID])
REFERENCES [dbo].[Order] ([OID])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([Category_id])
REFERENCES [dbo].[category] ([Category_id])
GO
ALTER TABLE [dbo].[Wishlist_detail]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_detail_account] FOREIGN KEY([AccID])
REFERENCES [dbo].[account] ([accID])
GO
ALTER TABLE [dbo].[Wishlist_detail] CHECK CONSTRAINT [FK_Wishlist_detail_account]
GO
ALTER TABLE [dbo].[Wishlist_detail]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_detail_product] FOREIGN KEY([Product_id])
REFERENCES [dbo].[product] ([Product_id])
GO
ALTER TABLE [dbo].[Wishlist_detail] CHECK CONSTRAINT [FK_Wishlist_detail_product]
GO
