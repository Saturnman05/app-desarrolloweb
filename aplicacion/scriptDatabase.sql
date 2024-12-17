CREATE DATABASE FOODKCALC;
GO

USE [FOODKCALC]
GO



/****** Object:  Table [dbo].[Foods]    Script Date: 16/12/2024 11:21:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NULL,
	[UserName] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[DateRegistered] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateRegistered]
GO

CREATE TABLE [dbo].[Foods](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [varchar](255) NULL,
	[Protein] [decimal](18, 2) NULL,
	[Carbs] [decimal](18, 2) NULL,
	[Fat] [decimal](18, 2) NULL,
	[Extra] [decimal](18, 2) NULL,
	[UserId] [int] NULL,
	[Total]  AS ((([Protein]*(4)+[Carbs]*(4))+[Fat]*(9))+[Extra]), 
PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Foods] ADD  DEFAULT ((0)) FOR [Protein]
GO

ALTER TABLE [dbo].[Foods] ADD  DEFAULT ((0)) FOR [Carbs]
GO

ALTER TABLE [dbo].[Foods] ADD  DEFAULT ((0)) FOR [Fat]
GO

ALTER TABLE [dbo].[Foods] ADD  DEFAULT ((0)) FOR [Extra]
GO

ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
