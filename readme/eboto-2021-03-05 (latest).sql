USE [master]
GO
/****** Object:  Database [eboto]    Script Date: 3/5/2021 3:49:42 PM ******/
CREATE DATABASE [eboto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eboto', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\eboto.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eboto_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\eboto_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eboto] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eboto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eboto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eboto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eboto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eboto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eboto] SET ARITHABORT OFF 
GO
ALTER DATABASE [eboto] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [eboto] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [eboto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eboto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eboto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eboto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eboto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eboto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eboto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eboto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eboto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eboto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eboto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eboto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eboto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eboto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eboto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eboto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eboto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eboto] SET  MULTI_USER 
GO
ALTER DATABASE [eboto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eboto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eboto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eboto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [eboto]
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_ALREADY_VOTE_CONTEST]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHECK_ALREADY_VOTE_CONTEST]
	@userId NUMERIC
	, @tableId NUMERIC

AS
SELECT *
FROM t_vote_contestant
WHERE vote_userID = @userId
AND vote_contestID = @tableId
ORDER BY 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_ALREADY_VOTE_ELECTION]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHECK_ALREADY_VOTE_ELECTION]
	@userId NUMERIC
	, @tableId NUMERIC

AS
SELECT *
FROM t_vote_candidate
WHERE vote_userID = @userId
AND vote_electionID = @tableId
ORDER BY 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY


GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_ALREADY_VOTE_POLL]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CHECK_ALREADY_VOTE_POLL]
	@userId NUMERIC
	, @tableId NUMERIC

AS
SELECT *
FROM t_vote_option
WHERE vote_userID = @userId
AND vote_pollID = @tableId
ORDER BY 1 OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_PRIVATE]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_PRIVATE]
	@orgName VARCHAR(MAX)
	
AS
SELECT * 
FROM r_org
WHERE orgName = @orgName

GO
/****** Object:  StoredProcedure [dbo].[SP_SPECIFIC_GET_CONTEST]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SPECIFIC_GET_CONTEST]
	@id NUMERIC

AS
SELECT *
FROM t_contest
WHERE id = @id

GO
/****** Object:  StoredProcedure [dbo].[SP_SPECIFIC_GET_ELECTION]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SPECIFIC_GET_ELECTION]
	@id NUMERIC

AS
SELECT *
FROM t_election
WHERE id = @id

GO
/****** Object:  StoredProcedure [dbo].[SP_SPECIFIC_GET_EP]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SPECIFIC_GET_EP]
	@id NUMERIC

AS
SELECT *
FROM t_ep
WHERE id = @id

GO
/****** Object:  StoredProcedure [dbo].[SP_SPECIFIC_GET_POLL]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SPECIFIC_GET_POLL]
	@id NUMERIC

AS
SELECT *
FROM t_poll
WHERE id = @id

GO
/****** Object:  Table [dbo].[r_org]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[r_org](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[orgName] [varchar](100) NULL,
	[orgDateCreated] [datetime] NULL,
	[orgStatus] [bit] NULL,
	[orgLogo] [varchar](200) NULL,
 CONSTRAINT [PK_orgsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_candidate]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[candidateElectionID] [numeric](18, 0) NULL,
	[candidateDateCreated] [datetime] NULL,
	[candidateStatus] [bit] NULL,
	[candidatePosition] [varchar](100) NULL,
	[candidateName] [varchar](200) NULL,
	[candidateDescription] [varchar](1000) NULL,
	[candidateImage] [varchar](500) NULL,
	[candidatePartylist] [numeric](18, 0) NULL,
	[candidateEpID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_candidatesID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contest]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_contest](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestName] [varchar](100) NULL,
	[contestDateStart] [datetime] NULL,
	[contestDateEnd] [datetime] NULL,
	[contestOrg] [numeric](18, 0) NULL,
	[contestDateCreated] [datetime] NULL,
	[contestStatus] [bit] NULL,
	[contestDescription] [varchar](1000) NULL,
	[contestPassword] [varchar](250) NULL,
 CONSTRAINT [PK_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_contestant]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[contestantName] [varchar](100) NULL,
	[contestantDescription] [varchar](1000) NULL,
	[contestantStatus] [bit] NULL,
	[contestantContestID] [numeric](18, 0) NULL,
	[contestantImage] [varchar](500) NULL,
	[contestantDateCreated] [datetime] NULL,
 CONSTRAINT [PK_contestantID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_election]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_election](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[electionName] [varchar](100) NULL,
	[electionDateStart] [datetime] NULL,
	[electionDateEnd] [datetime] NULL,
	[electionOrg] [numeric](18, 0) NULL,
	[electionDateCreated] [datetime] NULL,
	[electionStatus] [bit] NULL,
	[electionDescription] [varchar](1000) NULL,
	[electionPassword] [varchar](250) NULL,
 CONSTRAINT [PK_electionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ep]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ep](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[epName] [varchar](250) NULL,
	[epDateStart] [datetime] NULL,
	[epDateEnd] [datetime] NULL,
	[epDescription] [varchar](1000) NULL,
	[epPassword] [varchar](250) NULL,
	[epDateCreated] [datetime] NULL,
	[epStatus] [bit] NULL,
	[epOrg] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ep_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_option]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[optionPollID] [numeric](18, 0) NULL,
	[optionName] [varchar](100) NULL,
	[optionDateCreated] [datetime] NULL,
	[optionStatus] [bit] NULL,
 CONSTRAINT [PK_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_partylist]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_partylist](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[partylistName] [varchar](250) NULL,
	[partylistDescription] [varchar](1000) NULL,
	[partylistDateCreated] [datetime] NULL,
	[partylistStatus] [bit] NULL,
	[partylistImage] [varchar](500) NULL,
	[partylistElectionID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_partylist_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_poll]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_poll](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[pollName] [varchar](100) NULL,
	[pollDateStart] [datetime] NULL,
	[pollDateEnd] [datetime] NULL,
	[pollOrg] [numeric](18, 0) NULL,
	[pollDateCreated] [datetime] NULL,
	[pollStatus] [bit] NULL,
	[pollDescription] [varchar](1000) NULL,
	[pollPassword] [varchar](250) NULL,
 CONSTRAINT [PK_pollsID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[userFirstName] [varchar](100) NULL,
	[userMiddleName] [varchar](100) NULL,
	[userLastName] [varchar](100) NULL,
	[userStudentNo] [varchar](100) NULL,
	[userPassword] [varchar](100) NULL,
	[userEmail] [varchar](100) NULL,
	[userType] [varchar](100) NULL,
	[userCourse] [varchar](255) NULL,
	[userDateCreated] [datetime] NULL,
	[userStatus] [bit] NULL,
	[userOrg] [numeric](18, 0) NULL,
 CONSTRAINT [PK_userID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_vote_candidate]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_candidateID] [numeric](18, 0) NULL,
	[vote_electionID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_candidateID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_vote_contestant]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_contestant](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_contestantID] [numeric](18, 0) NULL,
	[vote_contestID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_contestID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_vote_ep_candidate]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_ep_candidate](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_candidateID] [numeric](18, 0) NULL,
	[vote_epID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_vote_option]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vote_option](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[vote_userID] [numeric](18, 0) NULL,
	[vote_optionID] [numeric](18, 0) NULL,
	[vote_pollID] [numeric](18, 0) NULL,
	[voteDateCreated] [datetime] NULL,
 CONSTRAINT [PK_vote_optionID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ALL_CONTEST_VOTES]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ALL_CONTEST_VOTES] 

AS
SELECT "t_vote_contestant"."id", "contestName", "contestantName", (userFirstName+' '+userLastName+' ') AS voterName, "userStudentNo", "userCourse", FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated FROM "t_vote_contestant" LEFT JOIN "t_contest" ON "t_contest"."id" = "t_vote_contestant"."vote_contestID" LEFT JOIN "t_user" ON "t_user"."id" = "t_vote_contestant"."vote_userID" LEFT JOIN "t_contestant" ON "t_contestant"."id" = "t_vote_contestant"."vote_contestantID"

GO
/****** Object:  View [dbo].[ALL_ELECTION_VOTES]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ALL_ELECTION_VOTES] 

AS
SELECT 
"t_vote_candidate"."id"
, "electionName"
, "candidateName"
, (userFirstName+' '+userLastName+' ') AS voterName
, "userStudentNo", "userCourse"
, FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated 
FROM "t_vote_candidate" 
LEFT JOIN "t_election" 
ON "t_election"."id" = "t_vote_candidate"."vote_electionID" 
LEFT JOIN "t_user" 
ON "t_user"."id" = "t_vote_candidate"."vote_userID" 
LEFT JOIN "t_candidate" 
ON "t_candidate"."id" = "t_vote_candidate"."vote_candidateID" 

GO
/****** Object:  View [dbo].[ALL_POLL_VOTES]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ALL_POLL_VOTES] 

AS
SELECT "t_vote_option"."id", "pollName", "optionName", (userFirstName+' '+userLastName+' ') AS voterName, "userStudentNo", "userCourse", FORMAT(voteDateCreated, 'MMM dd, yyyy - hh:mm tt') as voteDateCreated FROM "t_vote_option" LEFT JOIN "t_poll" ON "t_poll"."id" = "t_vote_option"."vote_pollID" LEFT JOIN "t_user" ON "t_user"."id" = "t_vote_option"."vote_userID" LEFT JOIN "t_option" ON "t_option"."id" = "t_vote_option"."vote_optionID"

GO
/****** Object:  View [dbo].[CONTEST_MONTH_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CONTEST_MONTH_COUNT] 

AS

SELECT MONTH(voteDateCreated) as month, COUNT(*) as count FROM t_vote_contestant WHERE YEAR(voteDateCreated) = '2021' GROUP BY MONTH(voteDateCreated)


GO
/****** Object:  View [dbo].[ELECTION_MONTH_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ELECTION_MONTH_COUNT] 

AS

SELECT MONTH(voteDateCreated) as month, COUNT(*) as count FROM t_vote_candidate WHERE YEAR(voteDateCreated) = '2021' GROUP BY MONTH(voteDateCreated)


GO
/****** Object:  View [dbo].[GET_ACTIVE_CONTEST_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_ACTIVE_CONTEST_COUNT] 

AS

SELECT COUNT(*) as active_contest_count FROM t_contest WHERE contestStatus = 1 AND contestDateEnd >= GETDATE()


GO
/****** Object:  View [dbo].[GET_ACTIVE_ELECTION_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_ACTIVE_ELECTION_COUNT] 

AS

SELECT COUNT(*) as active_election_count FROM "t_election" WHERE "electionStatus" = 1 AND "electionDateEnd" >= GETDATE()


GO
/****** Object:  View [dbo].[GET_ACTIVE_POLL_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_ACTIVE_POLL_COUNT] 

AS

SELECT COUNT(*) as active_poll_count FROM t_poll WHERE pollStatus = 1 AND pollDateEnd >= GETDATE()


GO
/****** Object:  View [dbo].[GET_CANDIDATE_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_CANDIDATE_COUNT] 

AS

SELECT COUNT(*) as candidate_count FROM t_candidate WHERE candidateStatus = 1


GO
/****** Object:  View [dbo].[GET_CONTEST_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_CONTEST_COUNT] 

AS

SELECT COUNT(*) as contest_count FROM t_contest


GO
/****** Object:  View [dbo].[GET_CONTESTANT_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_CONTESTANT_COUNT] 

AS

SELECT COUNT(*) as contestant_count FROM t_contestant WHERE contestantStatus = 1


GO
/****** Object:  View [dbo].[GET_ELECTION_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_ELECTION_COUNT] 

AS

SELECT COUNT(*) as election_count FROM t_election


GO
/****** Object:  View [dbo].[GET_OPTION_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_OPTION_COUNT] 

AS

SELECT COUNT(*) as option_count FROM t_option WHERE optionStatus = 1


GO
/****** Object:  View [dbo].[GET_ORG_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_ORG_COUNT] 

AS

SELECT COUNT(*) as org_count FROM r_org WHERE orgStatus = 1


GO
/****** Object:  View [dbo].[GET_POLL_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_POLL_COUNT] 

AS

SELECT COUNT(*) as poll_count FROM t_poll


GO
/****** Object:  View [dbo].[GET_USER_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[GET_USER_COUNT] 

AS

SELECT COUNT(*) as user_count FROM "t_user" WHERE "userStatus" = 1


GO
/****** Object:  View [dbo].[POLL_MONTH_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[POLL_MONTH_COUNT] 

AS

SELECT MONTH(voteDateCreated) as month, COUNT(*) as count FROM t_vote_option WHERE YEAR(voteDateCreated) = '2021' GROUP BY MONTH(voteDateCreated)


GO
/****** Object:  View [dbo].[USER_MONTH_COUNT]    Script Date: 3/5/2021 3:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[USER_MONTH_COUNT] 

AS

SELECT MONTH(userDateCreated) as month, COUNT(*) as count FROM t_user WHERE YEAR(userDateCreated) = '2021' AND userStatus = 1 GROUP BY MONTH(userDateCreated)


GO
SET IDENTITY_INSERT [dbo].[r_org] ON 

INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(1 AS Numeric(18, 0)), N'PUBLIC', CAST(0x0000ACA700E9E4C1 AS DateTime), 1, N'PUPLogo22.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(2 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000ACA700EA046B AS DateTime), 1, N'11942076_1674469006101558_3534662844221263438_o6.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(3 AS Numeric(18, 0)), N'YES', CAST(0x0000ACA700EA19D4 AS DateTime), 1, N'yes2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(4 AS Numeric(18, 0)), N'YES', CAST(0x0000ACA700EA19F0 AS DateTime), 0, N'yes3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(5 AS Numeric(18, 0)), N'CHRS', CAST(0x0000ACA700EA50B3 AS DateTime), 1, N'CHRS2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(6 AS Numeric(18, 0)), N'CHRS', CAST(0x0000ACA700EA50D2 AS DateTime), 0, N'CHRS3.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(7 AS Numeric(18, 0)), N'JMS', CAST(0x0000ACA700EA6522 AS DateTime), 1, N'jms2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(8 AS Numeric(18, 0)), N'DOMT', CAST(0x0000ACA700EA7EE4 AS DateTime), 1, N'DOMT2.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(9 AS Numeric(18, 0)), N'FBTO', CAST(0x0000ACA700EA8FD0 AS DateTime), 1, N'fbto1.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(10 AS Numeric(18, 0)), N'PRIVATE', CAST(0x0000ACA700EAAF85 AS DateTime), 1, N'PUPLogo21.png')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(11 AS Numeric(18, 0)), N'TEST Org', CAST(0x0000ACB1016526A4 AS DateTime), 0, N'4448.jpg')
INSERT [dbo].[r_org] ([id], [orgName], [orgDateCreated], [orgStatus], [orgLogo]) VALUES (CAST(12 AS Numeric(18, 0)), N'asdf', CAST(0x0000ACD800EE8D31 AS DateTime), 0, N'PUPLogo2.jpg')
SET IDENTITY_INSERT [dbo].[r_org] OFF
SET IDENTITY_INSERT [dbo].[t_candidate] ON 

INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EDE4ED AS DateTime), 1, N'President', N'Arvin John Carino', N'AGE:21
BIRTHDATE: MARCH 03, 1999
MOTTO: TIME IS GOLD', N'12196195_1199439253404253_8781946651624041247_n2.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EE1E09 AS DateTime), 1, N'Developer', N'John Raven Glomar', N'AGE: 21
MOTTO: JUST DO IT', N'avatar_0120.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700EE75C7 AS DateTime), 1, N'QA', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o21.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EE9E1C AS DateTime), 1, N'QA', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o22.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700EF0597 AS DateTime), 1, N'Vice President', N'JETT MAIN', N'AGE: 24
MOTTO: WATCH THIS', N'Valorant-Wallpaper-Boys-Dark-Display3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA700F01061 AS DateTime), 1, N'QA', N'PHEONIX', N'AGE : 24
MOTTO: Jokes over your dead', N'valorant-offwhitelaunch-keyart1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F0BB1F AS DateTime), 1, N'PRESIDENT', N'RAZE', N'AGE:30
MOTTO: HERE COMES THE PARTY', N'120603301_233871211667769_2890483866310201068_o1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F0F579 AS DateTime), 1, N'Vice President', N'Breach', N'AGE:31
MOTTO: LETS GO!', N'120605198_233871331667757_4667358385407191493_o1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F119B5 AS DateTime), 1, N'Secretary', N'Joshua Pugoy', N'Age:21
Motto: DASAL LANG', N'129157035_1075137792910609_3363601868927077009_o3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F13A10 AS DateTime), 1, N'Auditor', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT', N'avatar_0121.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA700F1675E AS DateTime), 1, N'QA', N'Arvin John Carino', N'AGE:21
MOTTO: TIME IS GOLD', N'12196195_1199439253404253_8781946651624041247_n3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F1D67C AS DateTime), 1, N'PRESIDENT', N'Joshua Pugoy', N'AGE:21
MOTTO: DASAL LANG PARA PUMASA
BIRTHDATE: UNKNOWN', N'129157035_1075137792910609_3363601868927077009_o221.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F202E0 AS DateTime), 1, N'Vice President', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT
BIRTHDAY: UNKNOWN', N'avatar_0171.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F25880 AS DateTime), 1, N'Secretary', N'Arvin John Carino', N'AGE:21
MOTTO: TIME IS GOLD WHEN PLAYING VALORANT
BIRTHDATE: UKNOWN
', N'12196195_1199439253404253_8781946651624041247_n4.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F280CB AS DateTime), 1, N'QA', N'JETT', N'AGE :24
MOTTO: WATCH THIS
BIRTHDATE: UKNOWN', N'valorant-offwhitelaunch-keyart2.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F280E6 AS DateTime), 0, N'QA', N'JETT', N'AGE :24
MOTTO: WATCH THIS
BIRTHDATE: UKNOWN', N'valorant-offwhitelaunch-keyart3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA700F2E4AA AS DateTime), 1, N'QA', N'RAZE', N'AGE: 24
MOTTO: HERE COMES THE PARTY
BIRTHDATE: UKNOWN', N'120603301_233871211667769_2890483866310201068_o2.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F3770A AS DateTime), 1, N'President', N'John Raven Glomar', N'AGE:21
MOTTO: JUST DO IT
vote wisely', N'avatar_0141.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F3C879 AS DateTime), 1, N'Vice President', N'Joshua Pugoy', N'Vote Wisely
AGE: 21
MOTTO: DASAL LANG PARA PUMASA', N'129157035_1075137792910609_3363601868927077009_o2211.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F41063 AS DateTime), 1, N'QA', N'Arvin John Carino', N'PLEASE VOTE WISELY
Motto: time is gold
age: 21', N'12196195_1199439253404253_8781946651624041247_n5.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F43B61 AS DateTime), 1, N'Secretary', N'RAZE', N'VOTE WISELY
AGE: 23
MOTTO: HERE COMES THE PARTY', N'120603301_233871211667769_2890483866310201068_o3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700F47238 AS DateTime), 1, N'QA', N'Breach', N'Please Vote Wisely
age: 30
motto: LETS GO!
', N'120605198_233871331667757_4667358385407191493_o2.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F4BD46 AS DateTime), 1, N'President', N'John Raven Glomar', N'Must Vote Wisely', N'avatar_0161.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F4D5E6 AS DateTime), 1, N'Vice President', N'Arvin John Carino', N'Please Vote for me', N'12196195_1199439253404253_8781946651624041247_n51.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F50D9F AS DateTime), 1, N'Secretary', N'RAZE', N'Vote Vote Vote for me', N'120603301_233871211667769_2890483866310201068_o4.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700F5301A AS DateTime), 1, N'QA', N'Breach', N'VOTE FOR ME PLEASE', N'120605198_233871331667757_4667358385407191493_o3.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA70105D3A9 AS DateTime), 0, N'Secretary', N'Joshua Pugoy', N'IT 3-1', N'129157035_1075137792910609_3363601868927077009_e.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACC4010E9449 AS DateTime), 1, N'Test Positionasd', N'asd', N'asd', N'FMN_(1)2.png', CAST(2 AS Numeric(18, 0)), NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACC4010F5CF5 AS DateTime), 1, N'asd', N'asd', N'asd', N'FMN_(1)3.png', CAST(2 AS Numeric(18, 0)), NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(30 AS Numeric(18, 0)), NULL, CAST(0x0000ACC40139BEC2 AS DateTime), 1, N'asdas', N'Test', N'123', N'skins_for_sale.jpg', CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(31 AS Numeric(18, 0)), NULL, CAST(0x0000ACC4013A1032 AS DateTime), 1, N'asd', N'asd', N'asd', N'homepage.png', CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(32 AS Numeric(18, 0)), NULL, CAST(0x0000ACD5011F5BFE AS DateTime), 0, N'President', N'asd', N'asd', N'PUP_Mabini_Campus_-_pylon_(side_view)_(PUP,_Santa_Mesa,_Manila)(2018-03-06).jpg', CAST(8 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(33 AS Numeric(18, 0)), NULL, CAST(0x0000ACD50120E401 AS DateTime), 1, N'asd', N'asd123', N'asd', N'skins5.jpg', CAST(8 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(34 AS Numeric(18, 0)), NULL, CAST(0x0000ACD50120FE8E AS DateTime), 1, N'asd', N'asd', N'asd', N'prob.PNG', CAST(8 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(35 AS Numeric(18, 0)), NULL, CAST(0x0000ACD50127748A AS DateTime), 0, N'President', N'Raven', N'I am Raven 21 Years Old
a developer', N'homepage2.png', CAST(9 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(36 AS Numeric(18, 0)), NULL, CAST(0x0000ACD50128CBFC AS DateTime), 1, N'President', N'Erica Cantos', N'Test Description', N'skins6.jpg', CAST(9 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), CAST(0x0000ACD600FA83C5 AS DateTime), 1, N'President', N'Joshua Pugoy', N'Pogi. Cute
Minsan Kabet
Minsan Loyal', N'118187356_1205740003136574_1990694945786363613_n12.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(38 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), CAST(0x0000ACD600FAB786 AS DateTime), 1, N'President', N'Joshua Pugoy', N'SSC election will be held in August 2021.
SSC election will be held in August 2021.
SSC election will be held in August 2021.', N'118187356_1205740003136574_1990694945786363613_n13.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(25 AS Numeric(18, 0)), CAST(0x0000ACD600FE7A33 AS DateTime), 1, N'President', N'Joshua Pugoy', N'Cute
Pogi
Hot
', N'ds7.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(40 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF2CE9 AS DateTime), 1, N'President', N'Joshua Pugoy', N'aaaa
aaa
aa
', N'118187356_1205740003136574_1990694945786363613_n14.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(41 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF3BA6 AS DateTime), 1, N'President', N'Joshua Pugoy', N'aaa
aaa
aa
', N'118187356_1205740003136574_1990694945786363613_n15.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(42 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF49BD AS DateTime), 1, N'President', N'Raven Glomar', N'aaa
aa
aaa
', N'118187356_1205740003136574_1990694945786363613_n16.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(43 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD601004FCB AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n17.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(44 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD601005DBA AS DateTime), 1, N'President', N'Raven Glomar', N'POGI
CUTE 
POGI', N'118267180_2833657583520980_3285340352549293777_n4.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(45 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD601006EC7 AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n18.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(46 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD60100886D AS DateTime), 1, N'President', N'Arvin Carino', N'POGI
CUTE 
POGI', N'122135126_2882094888686490_3051737473414249191_o.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(47 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD601036203 AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n19.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(48 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD6010376DC AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
Hot', N'118267180_2833657583520980_3285340352549293777_n5.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(49 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD601038720 AS DateTime), 1, N'President', N'Raven Glomar', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n20.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(50 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD601061CD4 AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n23.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(51 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD601062E7D AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
hot', N'118267180_2833657583520980_3285340352549293777_n6.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(52 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD6010642DF AS DateTime), 1, N'Secretary', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'galaxy-wallpaper-123.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(53 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD601065269 AS DateTime), 1, N'President', N'Raven Glomar', N'POGI
CUTE 
POGI', N'marketing-information-system44.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(54 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106809F AS DateTime), 1, N'Secretary', N'Joshua Pugoy', N'POGIE 
hot
jejemon', N'ds9.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(55 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(0x0000ACD601085853 AS DateTime), 1, N'Secretary', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118187356_1205740003136574_1990694945786363613_n26.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(56 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(0x0000ACD60108665A AS DateTime), 1, N'President', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'118267180_2833657583520980_3285340352549293777_n8.png', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(57 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(0x0000ACD601087615 AS DateTime), 1, N'PRO', N'Joshua Pugoy', N'POGI
CUTE 
POGI', N'122135126_2882094888686490_3051737473414249191_o1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(58 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD60155AB6C AS DateTime), 1, N'President', N'Joshua Pugoy', N'Joshua Pugoy
BSIT 3-1
Quality Assurance
"Life is already hard, so take it easy"', N'Joshua.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD601567A9F AS DateTime), 1, N'President', N'Raven Glomar', N'Joshua Pugoy
BSIT 3-1
Full stack developer
"Live your life to the fullest"', N'Raven.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(61 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD601571EAE AS DateTime), 1, N'Vice President', N'Arvin Carino', N'Arvin Carino
BSIT 3-1
Front-end developer
"Love is always bigger than hate"', N'Arvin.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(62 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD60157757B AS DateTime), 1, N'Vice President', N' Bernard Teja', N'Bernard Teja
BSIT 3-1
"Give me stone, I will make fire with it"', N'Bernard.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD60158D154 AS DateTime), 1, N'Secretary', N'Erica Cantos', N'Erica Cantos
MM 3-1
Marketing strategist', N'Erica.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(65 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD6015934FE AS DateTime), 1, N'Auditor', N'Joylyn Castor', N'Joylyn Castor
MM 3-1
Auditor for 2 years in JMS  org.', N'joylyn1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(66 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015DC046 AS DateTime), 1, N'President', N'Juan Dela Cruz', N'MM 3-1
Mapagmahal at Mapagbigay
', N'118187356_1205740003136574_1990694945786363613_n28.png', CAST(14 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(67 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015E1111 AS DateTime), 1, N'Vice President', N'Jessica Panelo', N'MM 3-2
Malawak ang pagmamahal sa bawat studyante.', N'marketing-information-system46.jpg', CAST(14 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(68 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015E414B AS DateTime), 1, N'Secretary', N'Jenebib Romario', N'MM 1-1
Malawak ang kaalaman', N'Untitled26.png', CAST(14 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(69 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015EA5CA AS DateTime), 1, N'President', N'Marco Romero', N'MM 3-1
Matipuno at Makisig', N'sanaaa5.jpg', CAST(13 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(70 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015EE7A9 AS DateTime), 1, N'Vice President', N'Roanne Robino', N'MM 2-1
Masipag at Matiyaga', N'Untitled27.png', CAST(13 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(71 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6015F6315 AS DateTime), 1, N'Secretary', N'Rojean Maglayaw', N'MM 1-1
Mapagmahal sa bayan, maging sa Sintang Paaralan', N'121777957_2882094938686485_994954279288759290_o18.jpg', CAST(13 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(72 AS Numeric(18, 0)), NULL, CAST(0x0000ACD6016147FF AS DateTime), 1, N'President', N'Andrea Robreno', N'MM 3-1 
Dating pangulo sa klase nito.', N'Untitled28.png', CAST(12 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(73 AS Numeric(18, 0)), NULL, CAST(0x0000ACD601619543 AS DateTime), 1, N'Vice President', N'Layla Romualdo', N'MM 2-1
Dating bise presidente ng kaniyang klase.', N'sda.png', CAST(12 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(74 AS Numeric(18, 0)), NULL, CAST(0x0000ACD60161CAE9 AS DateTime), 1, N'Secretary', N'Jomari Jamabat', N'MM 1-1
Malawak ang pag-unawa', N'sana1.PNG', CAST(12 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(79 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008BB2CC AS DateTime), 1, N'President', N'Jomari Jamabat', N'This Election will be open for all partylist that will represent the Junior Marketing Society for the next SSC Election.
Choose the party that you want to be the next face of JMS.
Please vote wisely!', N'Jomari10.jpg', CAST(15 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(80 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008E5995 AS DateTime), 1, N'Secretary', N'Jomari Jamabat', N'MM 1-1
Malawak ang pag-unawa', N'Jomari11.jpg', CAST(18 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(81 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008E7EA8 AS DateTime), 1, N'Vice President', N'Layla Romualdo', N'MM 2-1
Dating bise presidente ng kaniyang klase.', N'Layla.jpg', CAST(18 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(82 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008E9741 AS DateTime), 1, N'President', N'Andrea Robreno', N'MM 3-1 
Dating pangulo sa klase nito.', N'Andrea3.png', CAST(18 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(83 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008EDB0D AS DateTime), 1, N'Secretary', N'Rojean Maglayaw', N'MM 1-1
Mapagmahal sa bayan, maging sa Sintang Paaralan', N'Rojean.jpg', CAST(17 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(84 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008EFDFA AS DateTime), 1, N'Vice President', N'Roanne Robino', N'MM 2-1
Masipag at Matiyaga', N'Roanne.jpg', CAST(17 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(85 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008F19E6 AS DateTime), 1, N'President', N'Marco Romero', N'MM 3-1
Matipuno at Makisig', N'Marco8.jpg', CAST(17 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(86 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008F65B8 AS DateTime), 1, N'Secretary', N'Jenebib Romario', N'MM 1-1
Malawak ang kaalaman', N'Jenebib3.jpg', CAST(16 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(87 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008F92EB AS DateTime), 1, N'Vice President', N'Jessica Panelo', N'MM 3-2
Malawak ang pagmamahal sa bawat studyante.', N'Jessica2.jpg', CAST(16 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(88 AS Numeric(18, 0)), NULL, CAST(0x0000ACD7008FAF79 AS DateTime), 1, N'President', N'Juan Dela Cruz', N'MM 3-1
Mapagmahal at Mapagbigay
', N'Juan.jpg', CAST(16 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(89 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(0x0000ACDA010A3D38 AS DateTime), 1, N'President', N'Arvin Carino', N'I aint pinoy
I''m chinoy!!', N'31_-_Cariño,_Arvin_John_C1.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(90 AS Numeric(18, 0)), CAST(35 AS Numeric(18, 0)), CAST(0x0000ACDE0142BA17 AS DateTime), 1, N'President', N'John Raven Glomar', N'dev', N'97_-_Glomar,_John_Raven_T.jpg', NULL, NULL)
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(91 AS Numeric(18, 0)), NULL, CAST(0x0000ACDE01435B3B AS DateTime), 1, N'President', N'asd', N'asd', N'1_-_Alindugan,_Bryan_Joseph_B.jpg', CAST(19 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_candidate] ([id], [candidateElectionID], [candidateDateCreated], [candidateStatus], [candidatePosition], [candidateName], [candidateDescription], [candidateImage], [candidatePartylist], [candidateEpID]) VALUES (CAST(92 AS Numeric(18, 0)), NULL, CAST(0x0000ACDE014376C6 AS DateTime), 1, N'asd', N'asd', N'asd', N'1_-_Alindugan,_Bryan_Joseph_B1.jpg', CAST(20 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[t_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_contest] ON 

INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(1 AS Numeric(18, 0)), N'Art Contest', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700FB0DD1 AS DateTime), 1, N'The Art Contest is open to all students of PUP Quezon City Branch.

Please Submit your entries as soon as possible! 

Thank you for participating!', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(2 AS Numeric(18, 0)), N'Mr. Pogi Contest', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACA700FC6564 AS DateTime), 1, N'This contest is open for IT 3-1 only.

The contest is open for all boys of IT 3-1', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(3 AS Numeric(18, 0)), N'Mr. & Ms. HR 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(5 AS Numeric(18, 0)), CAST(0x0000ACA700FF4834 AS DateTime), 1, N'The search for Mr. & Ms. Human Resource is now open!

First year to Fourth year must have their own candidates! 

', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(4 AS Numeric(18, 0)), N'Hip - Hop Competition 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA70100DB12 AS DateTime), 1, N'The Hip - Hop Competition is open for students of PUP Quezon City only!

The group must have 5 - 10 members!

*  Cash Prize is waiting! *', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(5 AS Numeric(18, 0)), N'Spoken Word Poetry', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA701027416 AS DateTime), 1, N'The contest is open for every student that are ready to share their poems to everyone.

cc', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(6 AS Numeric(18, 0)), N'123', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200FA831E AS DateTime), 1, N'123', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(7 AS Numeric(18, 0)), N'Mr. Pogi Contest', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD601055412 AS DateTime), 0, N'Sino ang pogi sa pup qc?', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(8 AS Numeric(18, 0)), N'Mr. Pogi Contest 2', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD601077EDD AS DateTime), 0, N'Pogi?
', NULL)
INSERT [dbo].[t_contest] ([id], [contestName], [contestDateStart], [contestDateEnd], [contestOrg], [contestDateCreated], [contestStatus], [contestDescription], [contestPassword]) VALUES (CAST(9 AS Numeric(18, 0)), N'Mr. PUPQC 2021', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACF9018B80D4 AS DateTime), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACD700729EE2 AS DateTime), 1, N'This contest will show who is the most handsome among all Marketing students of PUP QC.
Sino nga ba ang pogi? Pano nga ba maging pogi?', NULL)
SET IDENTITY_INSERT [dbo].[t_contest] OFF
SET IDENTITY_INSERT [dbo].[t_contestant] ON 

INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'IT 3-1
"Ang pag-ibig ay parang tahong"', 1, CAST(5 AS Numeric(18, 0)), N'X1.jpg', CAST(0x0000ACA70108430D AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), N'Arvin Carino', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'C2.jpg', CAST(0x0000ACA7010B4A85 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), N'Raven Glomar', N'IT 3-1
"Ang bituin ay gabay lamang"', 0, CAST(1 AS Numeric(18, 0)), N'c3.jpg', CAST(0x0000ACA7010CB6E4 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), N'Raven Glomar', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'c31.jpg', CAST(0x0000ACA7010CD445 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), N'Erica Cantos', N'MM 3-1
"Ang puso at isip ay kasama sa pagmamahal"', 1, CAST(4 AS Numeric(18, 0)), N'c4.jpg', CAST(0x0000ACA7010D21A3 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), N'Erica Cantos', N'MM 2-1', 1, CAST(5 AS Numeric(18, 0)), N'c41.jpg', CAST(0x0000ACA7010D3F44 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), N'Bernard Teja', N'IT 3-1', 1, CAST(5 AS Numeric(18, 0)), N'C5.jpg', CAST(0x0000ACA7010D7292 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'Poging Hiphop dancerist ng IT 3-1!', 1, CAST(4 AS Numeric(18, 0)), N'X2.jpg', CAST(0x0000ACA7010DB6F6 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), N'Raven Glomar', N'Poging Developer at Athlete ng PUP QC', 1, CAST(4 AS Numeric(18, 0)), N'c32.jpg', CAST(0x0000ACA7010DE816 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), N'Arvin and The Squad', N'Poging Developer at Volleyball Player ng PUP QC', 1, CAST(4 AS Numeric(18, 0)), N'M31.jpg', CAST(0x0000ACA7010E0F1C AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), N'JETT', N'Cute na exchange student from Korea!', 1, CAST(4 AS Numeric(18, 0)), N'JETT.jpg', CAST(0x0000ACA7010E84A2 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'Mr. but he has no Ms. ', 1, CAST(3 AS Numeric(18, 0)), N'M1.jpg', CAST(0x0000ACA7010EDDB9 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), N'Raven Glomar', N'Mr. IT 2018 AND 2019', 1, CAST(3 AS Numeric(18, 0)), N'M2.jpg', CAST(0x0000ACA70110A771 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), N'Arvin Carino', N'Mr. IT 2016', 1, CAST(3 AS Numeric(18, 0)), N'M3.jpg', CAST(0x0000ACA70110E1BA AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), N'Erica Cantos', N'Ms. Marketing 2017, 2018, and 2019', 1, CAST(3 AS Numeric(18, 0)), N'm4.jpg', CAST(0x0000ACA701111DCD AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'pogi true pa sa legit
single ready to mingle', 1, CAST(2 AS Numeric(18, 0)), N'p1.jpg', CAST(0x0000ACA70111B8E7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), N'Raven Glomar', N'Developer ng room, Pogi, karapat dapat sa trono.', 1, CAST(2 AS Numeric(18, 0)), N'p2.jpg', CAST(0x0000ACA7011212D4 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(18 AS Numeric(18, 0)), N'Arvin Carino', N'Legit pogi, mayaman kaso taken. ', 1, CAST(2 AS Numeric(18, 0)), N'p3.jpg', CAST(0x0000ACA70112A504 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(19 AS Numeric(18, 0)), N'Bernard Teja', N'Pogi, Bikerist, tsaka Malaki maskels.', 1, CAST(2 AS Numeric(18, 0)), N'p4.jpg', CAST(0x0000ACA70112F8C7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(20 AS Numeric(18, 0)), N'Breach', N'Legit din pogi kaso madalas manghilo at mambulag', 1, CAST(2 AS Numeric(18, 0)), N'PP4.png', CAST(0x0000ACA701136349 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(21 AS Numeric(18, 0)), N'KILLJOY', N'Made by Mr. Raven Glomar of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'valorant-killjoy-valorant-digital-art-artwork-digital-hd-wallpaper-thumb.jpg', CAST(0x0000ACA70114BDCD AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(22 AS Numeric(18, 0)), N'Damage', N'Made by Mr. Joshua Pugoy of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Valorant-gets-closed-beta-patch-to-address-community-feedback-3.jpg', CAST(0x0000ACA70114E704 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(23 AS Numeric(18, 0)), N'THE VALORANT', N'Made by Mr. Arvin Carino of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'The_Valorant.jpg', CAST(0x0000ACA701150EFF AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(24 AS Numeric(18, 0)), N'Sage', N'Made by Ms. Erica Cantos of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Sage.jpg', CAST(0x0000ACA701152F5D AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(25 AS Numeric(18, 0)), N'Sova', N'Made by Mr. Bernard Teja of IT 3-1', 1, CAST(1 AS Numeric(18, 0)), N'Sova.jpg', CAST(0x0000ACA701154F3D AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(26 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'POGI
CUTE 
POGI', 1, CAST(7 AS Numeric(18, 0)), N'ds8.jpg', CAST(0x0000ACD601056743 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(27 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'POGI
MAHIYAIN
HOT', 1, CAST(7 AS Numeric(18, 0)), N'118187356_1205740003136574_1990694945786363613_n21.png', CAST(0x0000ACD6010584B3 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(28 AS Numeric(18, 0)), N'Arvin Carino', N'POGI
CUTE 
mAPUTI', 1, CAST(7 AS Numeric(18, 0)), N'121777957_2882094938686485_994954279288759290_o14.jpg', CAST(0x0000ACD601059837 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(29 AS Numeric(18, 0)), N'Raven Glomar', N'POGI
CUTE 
POGI', 1, CAST(7 AS Numeric(18, 0)), N'118187356_1205740003136574_1990694945786363613_n22.png', CAST(0x0000ACD60105C326 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(30 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'POGI
CUTE 
HOT', 1, CAST(8 AS Numeric(18, 0)), N'118187356_1205740003136574_1990694945786363613_n24.png', CAST(0x0000ACD6010796EE AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(31 AS Numeric(18, 0)), N'Raven Glomar', N'hOT?', 1, CAST(8 AS Numeric(18, 0)), N'118267180_2833657583520980_3285340352549293777_n7.png', CAST(0x0000ACD60107A6E3 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(32 AS Numeric(18, 0)), N'Arvin Carino', N'cUTE?', 1, CAST(8 AS Numeric(18, 0)), N'121777957_2882094938686485_994954279288759290_o15.jpg', CAST(0x0000ACD60107B6A9 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(33 AS Numeric(18, 0)), N'Joshua Philip Pugoy', N'pogi', 1, CAST(8 AS Numeric(18, 0)), N'118187356_1205740003136574_1990694945786363613_n25.png', CAST(0x0000ACD60107DFB7 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(34 AS Numeric(18, 0)), N'Ronron Macaliglig', N'MM 3-1
Matipuno, Moreno, Mapagmahal
"Ang puno ay hindi puno, kung wala itong bunga"', 1, CAST(9 AS Numeric(18, 0)), N'ronron.jpg', CAST(0x0000ACD700733B74 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(35 AS Numeric(18, 0)), N'Carlo Angelito', N'MM 3-2
Makisig, Mapagbigay, ay Tisoy
"I ain''t Tisoy, I''m PINOY!"', 1, CAST(9 AS Numeric(18, 0)), N'Carlo.jpg', CAST(0x0000ACD70073945A AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(36 AS Numeric(18, 0)), N'Jobert Delmundo', N'MM 2-1
Gym Guy, Malaki muscles, at Respetado
"Ang katawan ay hiram lamang, kailan mo isasauli?"', 1, CAST(9 AS Numeric(18, 0)), N'Jobert.jpg', CAST(0x0000ACD70073F710 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(37 AS Numeric(18, 0)), N'Mike Dumampi', N'MM 2-2
Gamer at Loyal.
"Computer games lang paglalaruan, hindi ikaw"', 1, CAST(9 AS Numeric(18, 0)), N'Mike.jpg', CAST(0x0000ACD70074AFA2 AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(38 AS Numeric(18, 0)), N'Junibert Dimasalang', N'MM 4-1
Matalino, Palaaral, at Mananayaw
"Bihira ang isang lalaking palaaral, bakit mo pa ako papakawalan?"', 1, CAST(9 AS Numeric(18, 0)), N'Juniebert.jpg', CAST(0x0000ACD70075508E AS DateTime))
INSERT [dbo].[t_contestant] ([id], [contestantName], [contestantDescription], [contestantStatus], [contestantContestID], [contestantImage], [contestantDateCreated]) VALUES (CAST(39 AS Numeric(18, 0)), N'Jemar Crisostomo', N'MM 1-1
Boxer, Basketball player, Bad boi
"Kapag tayo nag away, baka mapagkamalan kitang punching bag"', 1, CAST(9 AS Numeric(18, 0)), N'Jemar.jpg', CAST(0x0000ACD70076453E AS DateTime))
SET IDENTITY_INSERT [dbo].[t_contestant] OFF
SET IDENTITY_INSERT [dbo].[t_election] ON 

INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(1 AS Numeric(18, 0)), N'JMS ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACA700EB437A AS DateTime), 1, N'This Election is for JMS Election
Please Vote Wisely!', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(2 AS Numeric(18, 0)), N'SSC ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA700EB914B AS DateTime), 1, N'This Election is for the student who can be a great example', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(3 AS Numeric(18, 0)), N'FBTO ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACA700EC5929 AS DateTime), 1, N'This Election is for FBTO
To find a FBTO Student
who can lead', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(4 AS Numeric(18, 0)), N'CHRS ELECTION', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(5 AS Numeric(18, 0)), CAST(0x0000ACA700ED356A AS DateTime), 1, N'To find student who can lead CHRS Organization', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(5 AS Numeric(18, 0)), N'SSC', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACAA018B80D4 AS DateTime), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700ED40F4 AS DateTime), 0, N'asd', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(6 AS Numeric(18, 0)), N'COMMITS', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC0018B80D4 AS DateTime), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA700ED8146 AS DateTime), 1, N'FINDING STUDENT TO BE THE REPRESENTATIVE OF COMMITS', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(7 AS Numeric(18, 0)), N'TEST ELECTION', CAST(0x0000ACAB00000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAB01095572 AS DateTime), 0, N'', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(8 AS Numeric(18, 0)), N'TEST', CAST(0x0000ACAB00000000 AS DateTime), CAST(0x0000ACC0018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAB01096FF8 AS DateTime), 0, N'ASD', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(9 AS Numeric(18, 0)), N'Test', CAST(0x0000ACC100000000 AS DateTime), CAST(0x0000ACC6018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC100C743F7 AS DateTime), 1, N'test', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(10 AS Numeric(18, 0)), N'SSC Election', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC200E80CC7 AS DateTime), 1, N'asd', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(12 AS Numeric(18, 0)), N'123', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC200EB82D3 AS DateTime), 0, N'123', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(13 AS Numeric(18, 0)), N'asd', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC200F3FA18 AS DateTime), 1, N'asd', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(14 AS Numeric(18, 0)), N'SSC Electionew', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200F406F1 AS DateTime), 1, N'123', N'123')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(15 AS Numeric(18, 0)), N'test', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC200F42B3C AS DateTime), 1, N'123', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(16 AS Numeric(18, 0)), N'test123asd', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACC200F4383A AS DateTime), 1, N'123', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(17 AS Numeric(18, 0)), N'123', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200F4445B AS DateTime), 1, N'123', N'123')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(18 AS Numeric(18, 0)), N'asdasd', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200F4C8DB AS DateTime), 1, N'hghjgjh', N'bjvhh')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(19 AS Numeric(18, 0)), N'asd123', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200F69D91 AS DateTime), 1, N'asd123', N'81dc9bdb52d04dc20036dbd8313ed055')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(20 AS Numeric(18, 0)), N'Test Data', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200F756D0 AS DateTime), 1, N'Test Data', N'b26986ceee60f744534aaab928cc12df')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(21 AS Numeric(18, 0)), N'Test Data2', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC201132EA0 AS DateTime), 1, N'Test Data', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(22 AS Numeric(18, 0)), N'asd`', CAST(0x0000ACC300000000 AS DateTime), CAST(0x0000ACC4018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC300B1B031 AS DateTime), 0, N'asd', N'123')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(23 AS Numeric(18, 0)), N'SSC ELECTION 2021', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACE6018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD600F9EB20 AS DateTime), 0, N'SSC election will be held in August 2021.
SSC election will be held in August 2021.
SSC election will be held in August 2021.
', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(24 AS Numeric(18, 0)), N'BSIT Elections 2021', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD600FCD521 AS DateTime), 0, N'This is a private election organized by BSIT.This is a private election organized by BSIT.This is a private election organized by BSIT.
This is a private election organized by BSIT.', N'admin')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(25 AS Numeric(18, 0)), N'JMS ELECTION', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACD600FE442D AS DateTime), 0, N'This is a private election organized by JMS.
This is a private election organized by JMS.', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(26 AS Numeric(18, 0)), N'SSC ELECTION 2021.2', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD600FF1801 AS DateTime), 0, N'This is a PUBLIC election organized by SSC AND ADMIN.
This is a PUBLIC election organized by SSC AND ADMIN.
This is a PUBLIC election organized by SSC AND ADMIN.This is a PUBLIC election organized by ', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(27 AS Numeric(18, 0)), N'SSC ELECTION 2021.3', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD601002DA3 AS DateTime), 0, N'This is a PUBLIC election organized by SSC AND ADMIN.
This is a PUBLIC election organized by SSC AND ADMIN.
This is a PUBLIC election organized by SSC AND ADMIN.
', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(28 AS Numeric(18, 0)), N'SSC ELECTION 2021.4', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD601034A86 AS DateTime), 0, N'This Election is public. Organized by SSC and Admin.', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(29 AS Numeric(18, 0)), N'SSC ELECTION 2021.6', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD60105F87B AS DateTime), 0, N'Public election by ssc and admin', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(30 AS Numeric(18, 0)), N'SSC ELECTION 2021.7', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACD7018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD60108316A AS DateTime), 0, N'SSC SSC SSC SSC', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(31 AS Numeric(18, 0)), N'SSC ELECTION 2021', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACF9018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACD60155445A AS DateTime), 1, N'This election is organized by the PUP Quezon City COMELEC. with the help of school Administration. 
Please vote wisely!', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(32 AS Numeric(18, 0)), N'asd', CAST(0x0000ACD800000000 AS DateTime), CAST(0x0000ACD9018B80D4 AS DateTime), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACD8018173E6 AS DateTime), 0, N'ads', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(33 AS Numeric(18, 0)), N'Test Election', CAST(0x0000ACDA00000000 AS DateTime), CAST(0x0000ACDB018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACDA00FC5543 AS DateTime), 0, N'Test Description', NULL)
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(34 AS Numeric(18, 0)), N'Test Election', CAST(0x0000ACDA00000000 AS DateTime), CAST(0x0000ACDB018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACDA0109F780 AS DateTime), 0, N'test', N'admin')
INSERT [dbo].[t_election] ([id], [electionName], [electionDateStart], [electionDateEnd], [electionOrg], [electionDateCreated], [electionStatus], [electionDescription], [electionPassword]) VALUES (CAST(35 AS Numeric(18, 0)), N'Test Election', CAST(0x0000ACDE00000000 AS DateTime), CAST(0x0000ACE0018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACDE01428610 AS DateTime), 0, N'Test Descriptions', NULL)
SET IDENTITY_INSERT [dbo].[t_election] OFF
SET IDENTITY_INSERT [dbo].[t_ep] ON 

INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(1 AS Numeric(18, 0)), N'Test', CAST(0x0000ACC400000000 AS DateTime), CAST(0x0000ACC5018B80D4 AS DateTime), N'qweasd', NULL, CAST(0x0000ACC400EE2ECC AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(2 AS Numeric(18, 0)), N'test2', CAST(0x0000ACC400000000 AS DateTime), CAST(0x0000ACC5018B80D4 AS DateTime), N'asd', NULL, CAST(0x0000ACC401080EE8 AS DateTime), 1, CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(3 AS Numeric(18, 0)), N'Test', CAST(0x0000ACD500000000 AS DateTime), CAST(0x0000ACD6018B80D4 AS DateTime), N'Test', NULL, CAST(0x0000ACD5011848FE AS DateTime), 0, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(4 AS Numeric(18, 0)), N'Election for Running Partylist', CAST(0x0000ACD600000000 AS DateTime), CAST(0x0000ACDD018B80D4 AS DateTime), N'This Election will be open for all partylist that will represent the Junior Marketing Society for the next SSC Election.
Choose the party that you want to be the next face of JMS.
Please vote wisely!', NULL, CAST(0x0000ACD60159BFEB AS DateTime), 0, CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(5 AS Numeric(18, 0)), N'Election for Running Partylist 2', CAST(0x0000ACD700000000 AS DateTime), CAST(0x0000ACDD018B80D4 AS DateTime), N'This Election will be open for all partylist that will represent the Junior Marketing Society for the next SSC Election.
Choose the party that you want to be the next face of JMS.
Please vote wisely!', NULL, CAST(0x0000ACD7008B7AFC AS DateTime), 0, CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(6 AS Numeric(18, 0)), N'Election for Running Partylist', CAST(0x0000ACD700000000 AS DateTime), CAST(0x0000ACF9018B80D4 AS DateTime), N'This Election will be open for all partylist that will represent the Junior Marketing Society for the next SSC Election. 
Choose the party that you want to be the next face of JMS. Please vote wisely!', NULL, CAST(0x0000ACD7008C43E1 AS DateTime), 1, CAST(9 AS Numeric(18, 0)))
INSERT [dbo].[t_ep] ([id], [epName], [epDateStart], [epDateEnd], [epDescription], [epPassword], [epDateCreated], [epStatus], [epOrg]) VALUES (CAST(7 AS Numeric(18, 0)), N'Test EP MODe', CAST(0x0000ACDE00000000 AS DateTime), CAST(0x0000ACDF018B80D4 AS DateTime), N'asd', NULL, CAST(0x0000ACDE01433C1C AS DateTime), 0, CAST(1 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[t_ep] OFF
SET IDENTITY_INSERT [dbo].[t_option] ON 

INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Joshua Pugoy', CAST(0x0000ACA7011C24EC AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Erica Cantos', CAST(0x0000ACA7011C311E AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Joylyn Castor', CAST(0x0000ACA7011C3AD9 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Bernard Teja', CAST(0x0000ACA7011C43A2 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'Christine', CAST(0x0000ACA7011C628B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'KOPIKO 3in1', CAST(0x0000ACA7011D5B32 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'KOPIKO BLACK', CAST(0x0000ACA7011D64BF AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Nescafe 3in1', CAST(0x0000ACA7011D720B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'Great Taste White', CAST(0x0000ACA7011D89E0 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'PUP PYLON', CAST(0x0000ACA7011DF4BB AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'PUP CANTEEN', CAST(0x0000ACA7011E019D AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'STUDENTS LOUNGE', CAST(0x0000ACA7011E0F7B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'MISE', CAST(0x0000ACA7011E15F4 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'CHAPEL', CAST(0x0000ACA7011E1D48 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 19, 2021', CAST(0x0000ACA7011ED17B AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 18, 2021', CAST(0x0000ACA7011EEA85 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 17, 2021', CAST(0x0000ACA7011EFA94 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 16, 2021', CAST(0x0000ACA7011F0570 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'December 15, 2021', CAST(0x0000ACA7011F13CC AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'KOPIKO BLACK', CAST(0x0000ACD70076FBA5 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Nescafe 3in1', CAST(0x0000ACD70077056E AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Nescafe Black', CAST(0x0000ACD700770EED AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Great taste White', CAST(0x0000ACD700771772 AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(33 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Folgers Premium Black Coffee', CAST(0x0000ACD70077383F AS DateTime), 1)
INSERT [dbo].[t_option] ([id], [optionPollID], [optionName], [optionDateCreated], [optionStatus]) VALUES (CAST(34 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'Starbucks Americano Coffee', CAST(0x0000ACD7007755BD AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[t_option] OFF
SET IDENTITY_INSERT [dbo].[t_partylist] ON 

INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(1 AS Numeric(18, 0)), NULL, NULL, CAST(0x0000ACC400FA20B1 AS DateTime), 0, N'white_-_highlybred_official_logo_-_black.jpg', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(2 AS Numeric(18, 0)), NULL, NULL, CAST(0x0000ACC400FA7481 AS DateTime), 0, N'white_-_highlybred_official_logo_-_black1.jpg', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(3 AS Numeric(18, 0)), NULL, NULL, CAST(0x0000ACC400FABFA0 AS DateTime), 0, N'white_-_highlybred_official_logo_-_black2.jpg', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(4 AS Numeric(18, 0)), N'test', N'asdtest', CAST(0x0000ACC400FAEBF6 AS DateTime), 1, N'white_-_highlybred_official_logo_-_Light_Cyan.jpg', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(5 AS Numeric(18, 0)), N'asd', N'asd', CAST(0x0000ACC401022C46 AS DateTime), 1, N'white_-_highlybred_official_logo_-_black3.jpg', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(6 AS Numeric(18, 0)), N'ads', N'asd', CAST(0x0000ACC40102412B AS DateTime), 1, N'FMN_(1).png', CAST(1 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(7 AS Numeric(18, 0)), N'test3', N'asds', CAST(0x0000ACC401081D60 AS DateTime), 1, N'skins4.jpg', CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(8 AS Numeric(18, 0)), N'TEAM TES', N'asd', CAST(0x0000ACD5011F46A5 AS DateTime), 1, N'homepage1.png', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(9 AS Numeric(18, 0)), N'GO GO GUYS', N'asd
', CAST(0x0000ACD501275444 AS DateTime), 1, N'skins_for_sale1.jpg', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(11 AS Numeric(18, 0)), N'New Test', N'asd', CAST(0x0000ACD501304DB6 AS DateTime), 0, N'PUPLogo.png', CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(12 AS Numeric(18, 0)), N'PAYAPA', N'Ang partido ng PAYAPA ay nangangakong magbibigay ng pantay-pantay na karapatan sa bawat studyante. Maglalahad ng mas malinaw na plataporma at magiging bukas sa bawat suhestyon ng mga studyante ng PUP.', CAST(0x0000ACD6015BCFC6 AS DateTime), 1, N'pigeons-sky-sun.jpg', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(13 AS Numeric(18, 0)), N'TAYO', N'Ang TAYO partylist ay naniniwalang ang mga studyante ay dapat bigyang pansin lalo na sa panahon ng pandemic. ', CAST(0x0000ACD6015C99C1 AS DateTime), 1, N'marketing-information-system45.jpg', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(14 AS Numeric(18, 0)), N'MAGKAISA', N'Ang MAGKAISA partylist ay naniniwalang dapat tayong magkaisa! Ibibigay ang nararapat na para sa mga studyante, mga palaro, seminar, at mga kaabang-abang na events!', CAST(0x0000ACD6015D0F7B AS DateTime), 1, N'sanaaa4.jpg', CAST(4 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(15 AS Numeric(18, 0)), N'TAYO', N'This Election will be open for all partylist that will represent the Junior Marketing Society for the next SSC Election.
Choose the party that you want to be the next face of JMS.
Please vote wisely!', CAST(0x0000ACD7008B9941 AS DateTime), 1, N'Jenebib2.jpg', CAST(5 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(16 AS Numeric(18, 0)), N'MAGKAISA', N'Ang MAGKAISA partylist ay naniniwalang dapat tayong magkaisa! Ibibigay ang nararapat na para sa mga studyante, mga palaro, seminar, at mga kaabang-abang na events!', CAST(0x0000ACD7008DF4DA AS DateTime), 1, N'Magkaisa.png', CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(17 AS Numeric(18, 0)), N'TAYO', N'Ang TAYO partylist ay naniniwalang ang mga studyante ay dapat bigyang pansin lalo na sa panahon ng pandemic. ', CAST(0x0000ACD7008E0E22 AS DateTime), 1, N'Tayo!.png', CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(18 AS Numeric(18, 0)), N'PAYAPA', N'Ang partido ng PAYAPA ay nangangakong magbibigay ng pantay-pantay na karapatan sa bawat studyante. Maglalahad ng mas malinaw na plataporma at magiging bukas sa bawat suhestyon ng mga studyante ng PUP.', CAST(0x0000ACD7008E2661 AS DateTime), 1, N'Payapa.png', CAST(6 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(19 AS Numeric(18, 0)), N'test Partylist', N'asdasd', CAST(0x0000ACDE01434B90 AS DateTime), 1, N'11_-_Lomeda,_Dominic_John_I.jpg', CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_partylist] ([id], [partylistName], [partylistDescription], [partylistDateCreated], [partylistStatus], [partylistImage], [partylistElectionID]) VALUES (CAST(20 AS Numeric(18, 0)), N'asd', N'asda', CAST(0x0000ACDE0143673B AS DateTime), 1, N'5_-_Lamina,_Joseph_Victor_P.jpg', CAST(7 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[t_partylist] OFF
SET IDENTITY_INSERT [dbo].[t_poll] ON 

INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(1 AS Numeric(18, 0)), N'Cutest PUP QC student 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA70115CC29 AS DateTime), 1, N'PUP QUEZON CITY STUDENTS ARE WELCOME TO JOIN. AS LONG AS YOU ARE CONFIDENT AND YOU THINK THAT YOU ARE CUTE ENOUGH TO JOIN!', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(2 AS Numeric(18, 0)), N'Coffee Of The Year', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA701166316 AS DateTime), 1, N'Sino nga ba ang kapeng pang masa? Sino nga ba ang kapeng kasama ng mga studyante habang sila ay nagpupuyat kakagawa ng thesis?', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(3 AS Numeric(18, 0)), N'Best Research 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACA7011B6993 AS DateTime), 0, N'This is a private poll for IT 3-1 students only', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(4 AS Numeric(18, 0)), N'Best Research PUP Quezon City 2021 ', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011BC8DB AS DateTime), 0, N'This is open for all students of PUP QC. ', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(5 AS Numeric(18, 0)), N'Best Tiktoker of 2021', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011C09E5 AS DateTime), 1, N'Please vote the one you think who is the most viewed Tiktok influencer', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(6 AS Numeric(18, 0)), N'Best Place in PUP QC to Hang Out', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011D44EE AS DateTime), 1, N'This poll will show where in PUP QC we can enjoy or have fun while we are on breaktime!', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(7 AS Numeric(18, 0)), N'Best Date for Year End Party', CAST(0x0000ACA700000000 AS DateTime), CAST(0x0000ACC1018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACA7011EB4C8 AS DateTime), 1, N'In this poll, students are encouraged to vote for the official date of Year End Party.', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(8 AS Numeric(18, 0)), N'test', CAST(0x0000ACB700000000 AS DateTime), CAST(0x0000ACB8018B80D4 AS DateTime), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACB700CB71A6 AS DateTime), 0, N'asdsa
asd
asd
asd
asd
', NULL)
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(9 AS Numeric(18, 0)), N'123', CAST(0x0000ACC200000000 AS DateTime), CAST(0x0000ACC3018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACC200FAF69E AS DateTime), 0, N'123', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[t_poll] ([id], [pollName], [pollDateStart], [pollDateEnd], [pollOrg], [pollDateCreated], [pollStatus], [pollDescription], [pollPassword]) VALUES (CAST(10 AS Numeric(18, 0)), N'Best coffee', CAST(0x0000ACD700000000 AS DateTime), CAST(0x0000ACF9018B80D4 AS DateTime), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD70076EC61 AS DateTime), 1, N'Anong kape nga ba ang da best? Anong kape nga ba ang kasangga natin sa umaga? Anong kape ang kasama natin ma-stress sa acads?', N'admin')
SET IDENTITY_INSERT [dbo].[t_poll] OFF
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(1 AS Numeric(18, 0)), N'Joylyn', N'', N'Castor', N'2018-00453-CM-0', N'admin', N'joylyncastor@gmail.com', N'1', N'BSBA MM', CAST(0x0000ACA700E0EDB9 AS DateTime), 1, CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(2 AS Numeric(18, 0)), N'John Raven', N'Tamang', N'Glomar', N'2018-00232-CM-0', N'admin', N'jrglomar016@gmail.com', N'1', N'BSIT', CAST(0x0000ACA900BB7667 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(4 AS Numeric(18, 0)), N'Bernard', N'', N'Teja', N'test01', N'test01', N'bernardteja@gmail.com', N'1', N'BSIT', CAST(0x0000ACB700C450DB AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(5 AS Numeric(18, 0)), N'Rudy', N'', N'Prieto', N'test02', N'test02', N'rudyprieto@gmail.com', N'1', N'BBTE', CAST(0x0000ACB700C46A34 AS DateTime), 1, CAST(9 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(6 AS Numeric(18, 0)), N'Errol', N'', N'Dela Cruz', N'test03', N'test03', N'erroldelacruz@gmail.com', N'1', N'BSENT', CAST(0x0000ACB700C48716 AS DateTime), 1, CAST(3 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(7 AS Numeric(18, 0)), N'Robek', N'', N'Clores', N'test04', N'test04', N'robekclores@gmail.com', N'1', N'DOMT', CAST(0x0000ACB700C50B6D AS DateTime), 1, CAST(8 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(8 AS Numeric(18, 0)), N'Joshua Philip', N'', N'Pugoy', N'2018-00251-CM-0', N'admin', N'pugoyjoshua@gmail.com', N'1', N'BSIT', CAST(0x0000ACD600F744D5 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(9 AS Numeric(18, 0)), N'Erica', N'Canaveral', N'Cantos', N'2018-00396-CM-0', N'admin', N'ericacantos017@gmail.com', N'1', N'BSBA MM', CAST(0x0000ACD800B2207C AS DateTime), 1, CAST(7 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(10 AS Numeric(18, 0)), N'Rupert Jann', N'', N'Palicpic', N'2018-00072-CM-0', NULL, N'rupertpalicpic@gmail.com', N'1', N'BSIT', CAST(0x0000ACD90103608E AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(11 AS Numeric(18, 0)), N'Test', N'tes', N'tes', N'asd', NULL, N'test@gmail.com', N'1', N'test', CAST(0x0000ACD90103B51E AS DateTime), 0, NULL)
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(12 AS Numeric(18, 0)), N'User', N'', N'Admin', N'admin', N'admin', N'admin@gmail.com', N'2', N'BSIT', CAST(0x0000ACD90104CD14 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(13 AS Numeric(18, 0)), N'New', N'Test', N'Data', N'2018-00452-CM-0', N'SGhvc5Td', N'newtestdata@gmail.com', N'1', N'BSIT', CAST(0x0000ACDC014F7BD9 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(14 AS Numeric(18, 0)), N'Dummy', N'', N'01', N'dummy01', N'admin', N'dummy01@gmail.com', N'1', N'BSIT', CAST(0x0000ACDD00E2C795 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(15 AS Numeric(18, 0)), N'Dummy', N'', N'02', N'dummy02', N'admin', N'dummy02@gmail.com', N'1', N'BSIT', CAST(0x0000ACDD00E2D87A AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(16 AS Numeric(18, 0)), N'Dummy', N'', N'Z', N'2016-00232-CM-0', N'SGhvc5Td', N'dummyz@gmail.com', N'1', N'BSIT', CAST(0x0000ACDE012C3A9F AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(17 AS Numeric(18, 0)), N'John Raven', N'Tamang', N'Glomar', N'2020-00232-CM-0', N'admin', N'asdasd@gmail.com', N'1', N'BSIT', CAST(0x0000ACDE0132FB45 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(18 AS Numeric(18, 0)), N'Joseph', N'', N'Lamina', N'2018-00456-CM-0', N'admin', N'jr.glomar.srg@gmail.com', N'1', N'BSIT', CAST(0x0000ACDE0143A8A5 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
INSERT [dbo].[t_user] ([id], [userFirstName], [userMiddleName], [userLastName], [userStudentNo], [userPassword], [userEmail], [userType], [userCourse], [userDateCreated], [userStatus], [userOrg]) VALUES (CAST(19 AS Numeric(18, 0)), N'Test', N'New', N'User', N'test', N'Avx3fkUN', N'testgmail@gmail.com', N'1', N'BSIT', CAST(0x0000ACE20101DA72 AS DateTime), 1, CAST(2 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[t_user] OFF
SET IDENTITY_INSERT [dbo].[t_vote_candidate] ON 

INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACA800C01ABD AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA800F7D409 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACA800F7D409 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACA900F0FDF8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B50067 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B50069 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACAD00B5006A AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3777 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3778 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(25 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(0x0000ACAF011D3779 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207814 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(0x0000ACAF01207815 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(36 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACD5012C23ED AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACD5012C23F0 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(37 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), CAST(0x0000ACD600FEAF99 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), CAST(0x0000ACD600FEAF9A AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF5AC9 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(41 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF5ACA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(42 AS Numeric(18, 0)), CAST(26 AS Numeric(18, 0)), CAST(0x0000ACD600FF5ACA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(43 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD60101114D AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(44 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD60101114E AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(45 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD60101114E AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(46 AS Numeric(18, 0)), CAST(27 AS Numeric(18, 0)), CAST(0x0000ACD60101114F AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(47 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD60103A4E1 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(48 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD60103A4E4 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(49 AS Numeric(18, 0)), CAST(28 AS Numeric(18, 0)), CAST(0x0000ACD60103A4E4 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(33 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(50 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106A5FA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(34 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(51 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106A5FB AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(35 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(52 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106A5FB AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(36 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(53 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106A5FB AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(37 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(54 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(0x0000ACD60106A5FB AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(38 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD80118CE8B AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(39 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD8011EF3EA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(40 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(61 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD80121DFBA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(41 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD801244E6A AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(42 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD801244E6B AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(43 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD801253A77 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(44 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(65 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD801253A78 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(45 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD80125B527 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(46 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD80125B528 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(47 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD8012909B8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(48 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(65 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD8012909B9 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(49 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACD8012D50B9 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(50 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), CAST(89 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(0x0000ACDA010A7DE8 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(51 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(89 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(0x0000ACDA012F4BD4 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(52 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(62 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDD00E42939 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(53 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDD00E439E7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(54 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDD00E4403F AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(55 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDD00E44B48 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(56 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(62 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDD00E44B4A AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(57 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(58 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE012DF93B AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(58 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(61 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE012DF93F AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(59 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE012DF93F AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(60 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE013386F7 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(61 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(62 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE013386FA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(62 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE013386FA AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(63 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(60 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE01457967 AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(64 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(62 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE0145796B AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(65 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(64 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE0145796B AS DateTime))
INSERT [dbo].[t_vote_candidate] ([id], [vote_userID], [vote_candidateID], [vote_electionID], [voteDateCreated]) VALUES (CAST(66 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(65 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(0x0000ACDE0145796B AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_vote_contestant] ON 

INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACA800C0CA0A AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACB101300528 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACD6010736C8 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(36 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACD80131CDB8 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(35 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACD80132D057 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E3339A AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E33C3B AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(37 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E3439F AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E34D39 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E356E4 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(35 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E36244 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(35 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDD00E36AE1 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(39 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDE012E3F48 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDE0133E0B0 AS DateTime))
INSERT [dbo].[t_vote_contestant] ([id], [vote_userID], [vote_contestantID], [vote_contestID], [voteDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(38 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), CAST(0x0000ACDE0145EA4C AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_contestant] OFF
SET IDENTITY_INSERT [dbo].[t_vote_ep_candidate] ON 

INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(35 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACD5012D2671 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(0x0000ACD5012D2674 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(87 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD800C0B50C AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(85 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD800C0B50F AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD800C0B510 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD801236289 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD80123628A AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD80123628A AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(87 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACD80130CDF8 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(87 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDA00B9BDB9 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(84 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDC01502805 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(82 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDC01502806 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(80 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDC01502806 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3995D AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(86 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3B75A AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(83 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3C06D AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(83 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3C6EB AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3C6ED AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(83 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3D7F5 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(82 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3D7F8 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3D7F8 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(85 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3E731 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3F17F AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E3F85F AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E4050F AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E40DFF AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDD00E4181A AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(86 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE012E2759 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(29 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(84 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE012E275D AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(30 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(82 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE012E275D AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(31 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE0133ADBE AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(32 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE0133ADC0 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(33 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(88 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE0145C7C0 AS DateTime))
INSERT [dbo].[t_vote_ep_candidate] ([id], [vote_userID], [vote_candidateID], [vote_epID], [voteDateCreated]) VALUES (CAST(34 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(81 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(0x0000ACDE0145C7C2 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_ep_candidate] OFF
SET IDENTITY_INSERT [dbo].[t_vote_option] ON 

INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), CAST(0x0000ACA9015F5FA6 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(0x0000ACB100BC8D42 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012A1259 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012AB583 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012AD6C3 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012B39D6 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(32 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012B872A AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012B9EDD AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012BAB3F AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012BB52A AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012BBB25 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(29 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012BC65A AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(31 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACD8012BCDF0 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACDD00E3830C AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(16 AS Numeric(18, 0)), CAST(34 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACDE012E6174 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(17 AS Numeric(18, 0)), CAST(33 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACDE0133CF93 AS DateTime))
INSERT [dbo].[t_vote_option] ([id], [vote_userID], [vote_optionID], [vote_pollID], [voteDateCreated]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(18 AS Numeric(18, 0)), CAST(30 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), CAST(0x0000ACDE01460255 AS DateTime))
SET IDENTITY_INSERT [dbo].[t_vote_option] OFF
ALTER TABLE [dbo].[r_org] ADD  CONSTRAINT [DF_Org]  DEFAULT (getdate()) FOR [orgDateCreated]
GO
ALTER TABLE [dbo].[r_org] ADD  DEFAULT ((1)) FOR [orgStatus]
GO
ALTER TABLE [dbo].[t_candidate] ADD  CONSTRAINT [DF_Candidate]  DEFAULT (getdate()) FOR [candidateDateCreated]
GO
ALTER TABLE [dbo].[t_candidate] ADD  DEFAULT ((1)) FOR [candidateStatus]
GO
ALTER TABLE [dbo].[t_contest] ADD  CONSTRAINT [DF_Contest]  DEFAULT (getdate()) FOR [contestDateCreated]
GO
ALTER TABLE [dbo].[t_contest] ADD  DEFAULT ((1)) FOR [contestStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT ((1)) FOR [contestantStatus]
GO
ALTER TABLE [dbo].[t_contestant] ADD  DEFAULT (getdate()) FOR [contestantDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  CONSTRAINT [DF_Election]  DEFAULT (getdate()) FOR [electionDateCreated]
GO
ALTER TABLE [dbo].[t_election] ADD  DEFAULT ((1)) FOR [electionStatus]
GO
ALTER TABLE [dbo].[t_ep] ADD  DEFAULT (getdate()) FOR [epDateCreated]
GO
ALTER TABLE [dbo].[t_ep] ADD  DEFAULT ((1)) FOR [epStatus]
GO
ALTER TABLE [dbo].[t_option] ADD  CONSTRAINT [DF_Option]  DEFAULT (getdate()) FOR [optionDateCreated]
GO
ALTER TABLE [dbo].[t_option] ADD  DEFAULT ((1)) FOR [optionStatus]
GO
ALTER TABLE [dbo].[t_partylist] ADD  DEFAULT (getdate()) FOR [partylistDateCreated]
GO
ALTER TABLE [dbo].[t_partylist] ADD  DEFAULT ((1)) FOR [partylistStatus]
GO
ALTER TABLE [dbo].[t_poll] ADD  CONSTRAINT [DF_Poll]  DEFAULT (getdate()) FOR [pollDateCreated]
GO
ALTER TABLE [dbo].[t_poll] ADD  DEFAULT ((1)) FOR [pollStatus]
GO
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_userType]  DEFAULT ((1)) FOR [userType]
GO
ALTER TABLE [dbo].[t_user] ADD  CONSTRAINT [DF_User]  DEFAULT (getdate()) FOR [userDateCreated]
GO
ALTER TABLE [dbo].[t_user] ADD  DEFAULT ((1)) FOR [userStatus]
GO
ALTER TABLE [dbo].[t_vote_candidate] ADD  CONSTRAINT [DF_VoteCandidate]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_contestant] ADD  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_ep_candidate] ADD  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_vote_option] ADD  CONSTRAINT [DF_VoteOption]  DEFAULT (getdate()) FOR [voteDateCreated]
GO
ALTER TABLE [dbo].[t_candidate]  WITH CHECK ADD  CONSTRAINT [FK_candidate_electionID] FOREIGN KEY([candidateElectionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_candidate] CHECK CONSTRAINT [FK_candidate_electionID]
GO
ALTER TABLE [dbo].[t_candidate]  WITH CHECK ADD  CONSTRAINT [FK_candidate_ep] FOREIGN KEY([candidateEpID])
REFERENCES [dbo].[t_ep] ([id])
GO
ALTER TABLE [dbo].[t_candidate] CHECK CONSTRAINT [FK_candidate_ep]
GO
ALTER TABLE [dbo].[t_candidate]  WITH CHECK ADD  CONSTRAINT [FK_candidate_partylist] FOREIGN KEY([candidatePartylist])
REFERENCES [dbo].[t_partylist] ([id])
GO
ALTER TABLE [dbo].[t_candidate] CHECK CONSTRAINT [FK_candidate_partylist]
GO
ALTER TABLE [dbo].[t_contest]  WITH CHECK ADD  CONSTRAINT [FK_contest_orgID] FOREIGN KEY([contestOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_contest] CHECK CONSTRAINT [FK_contest_orgID]
GO
ALTER TABLE [dbo].[t_contestant]  WITH CHECK ADD  CONSTRAINT [FK_contestant_contestID] FOREIGN KEY([contestantContestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_contestant] CHECK CONSTRAINT [FK_contestant_contestID]
GO
ALTER TABLE [dbo].[t_election]  WITH CHECK ADD  CONSTRAINT [FK_election_orgID] FOREIGN KEY([electionOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_election] CHECK CONSTRAINT [FK_election_orgID]
GO
ALTER TABLE [dbo].[t_ep]  WITH CHECK ADD  CONSTRAINT [FK_ep_org] FOREIGN KEY([epOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_ep] CHECK CONSTRAINT [FK_ep_org]
GO
ALTER TABLE [dbo].[t_option]  WITH CHECK ADD  CONSTRAINT [FK_option_electionID] FOREIGN KEY([optionPollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_option] CHECK CONSTRAINT [FK_option_electionID]
GO
ALTER TABLE [dbo].[t_partylist]  WITH CHECK ADD  CONSTRAINT [FK_ep_electionID] FOREIGN KEY([partylistElectionID])
REFERENCES [dbo].[t_ep] ([id])
GO
ALTER TABLE [dbo].[t_partylist] CHECK CONSTRAINT [FK_ep_electionID]
GO
ALTER TABLE [dbo].[t_poll]  WITH CHECK ADD  CONSTRAINT [FK_poll_orgID] FOREIGN KEY([pollOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_poll] CHECK CONSTRAINT [FK_poll_orgID]
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD  CONSTRAINT [FK_user_org] FOREIGN KEY([userOrg])
REFERENCES [dbo].[r_org] ([id])
GO
ALTER TABLE [dbo].[t_user] CHECK CONSTRAINT [FK_user_org]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_candidateID] FOREIGN KEY([vote_candidateID])
REFERENCES [dbo].[t_candidate] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_candidateID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_electionID] FOREIGN KEY([vote_electionID])
REFERENCES [dbo].[t_election] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_electionID]
GO
ALTER TABLE [dbo].[t_vote_candidate]  WITH CHECK ADD  CONSTRAINT [FK_vote_c_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_candidate] CHECK CONSTRAINT [FK_vote_c_userID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_constestantID] FOREIGN KEY([vote_contestantID])
REFERENCES [dbo].[t_contestant] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_constestantID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_contestID] FOREIGN KEY([vote_contestID])
REFERENCES [dbo].[t_contest] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_contestID]
GO
ALTER TABLE [dbo].[t_vote_contestant]  WITH CHECK ADD  CONSTRAINT [FK_vote_con_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_contestant] CHECK CONSTRAINT [FK_vote_con_userID]
GO
ALTER TABLE [dbo].[t_vote_ep_candidate]  WITH CHECK ADD  CONSTRAINT [FK_ep_candidate] FOREIGN KEY([vote_candidateID])
REFERENCES [dbo].[t_candidate] ([id])
GO
ALTER TABLE [dbo].[t_vote_ep_candidate] CHECK CONSTRAINT [FK_ep_candidate]
GO
ALTER TABLE [dbo].[t_vote_ep_candidate]  WITH CHECK ADD  CONSTRAINT [FK_ep_parent] FOREIGN KEY([vote_epID])
REFERENCES [dbo].[t_ep] ([id])
GO
ALTER TABLE [dbo].[t_vote_ep_candidate] CHECK CONSTRAINT [FK_ep_parent]
GO
ALTER TABLE [dbo].[t_vote_ep_candidate]  WITH CHECK ADD  CONSTRAINT [FK_ep_user] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_ep_candidate] CHECK CONSTRAINT [FK_ep_user]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_candidateID] FOREIGN KEY([vote_optionID])
REFERENCES [dbo].[t_option] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_candidateID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_electionID] FOREIGN KEY([vote_pollID])
REFERENCES [dbo].[t_poll] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_electionID]
GO
ALTER TABLE [dbo].[t_vote_option]  WITH CHECK ADD  CONSTRAINT [FK_vote_o_userID] FOREIGN KEY([vote_userID])
REFERENCES [dbo].[t_user] ([id])
GO
ALTER TABLE [dbo].[t_vote_option] CHECK CONSTRAINT [FK_vote_o_userID]
GO
USE [master]
GO
ALTER DATABASE [eboto] SET  READ_WRITE 
GO
