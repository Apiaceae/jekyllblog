USE [cnpc]
GO
/****** 对象:  Table [dbo].[random_taxa]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[random_taxa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NOT NULL,
	[data_object_id] [int] NOT NULL,
	[name_id] [int] NOT NULL,
	[image_url] [nvarchar](765) NOT NULL,
	[thumb_url] [nvarchar](765) NOT NULL,
	[name] [nvarchar](765) NOT NULL,
	[common_name_en] [nvarchar](765) NOT NULL,
	[common_name_fr] [nvarchar](765) NOT NULL,
	[content_level] [int] NOT NULL,
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[taxon_concept_id] [int] NULL,
 CONSTRAINT [PK_random_taxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_provided_data_types]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_provided_data_types](
	[agent_data_type_id] [bigint] NOT NULL,
	[agent_id] [bigint] NOT NULL,
 CONSTRAINT [PK_agent_provided_data_types] PRIMARY KEY CLUSTERED 
(
	[agent_data_type_id] ASC,
	[agent_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[ranks]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ranks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](150) NOT NULL,
	[rank_group_id] [smallint] NOT NULL,
 CONSTRAINT [PK_ranks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_roles]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_roles](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_agent_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[ref_identifier_types]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_identifier_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ref_identifier_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_statuses]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_statuses](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_agent_statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[ref_identifiers]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_identifiers](
	[ref_id] [bigint] NOT NULL,
	[ref_identifier_type_id] [int] NOT NULL,
	[identifier] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_ref_identifiers] PRIMARY KEY CLUSTERED 
(
	[ref_id] ASC,
	[ref_identifier_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agents]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](765) NOT NULL,
	[acronym] [nvarchar](60) NOT NULL,
	[display_name] [nvarchar](765) NOT NULL,
	[homepage] [nvarchar](765) NOT NULL,
	[email] [nvarchar](225) NOT NULL,
	[username] [nvarchar](300) NOT NULL,
	[hashed_password] [nvarchar](300) NOT NULL,
	[remember_token] [nvarchar](765) NULL,
	[remember_token_expires_at] [datetime] NULL,
	[logo_url] [nvarchar](765) NULL,
	[logo_cache_url] [float] NULL,
	[logo_file_name] [nvarchar](765) NULL,
	[logo_content_type] [nvarchar](765) NULL,
	[logo_file_size] [bigint] NULL DEFAULT ((0)),
	[agent_status_id] [smallint] NOT NULL,
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_agents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[refs]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[full_reference] [nvarchar](1200) NOT NULL,
	[user_submitted] [smallint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_refs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agents_data_objects]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents_data_objects](
	[data_object_id] [bigint] NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[agent_role_id] [tinyint] NOT NULL,
	[view_order] [tinyint] NOT NULL,
 CONSTRAINT [PK_agents_data_objects] PRIMARY KEY CLUSTERED 
(
	[data_object_id] ASC,
	[agent_id] ASC,
	[agent_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[refs_taxa]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refs_taxa](
	[taxon_id] [bigint] NOT NULL,
	[ref_id] [bigint] NOT NULL,
 CONSTRAINT [PK_refs_taxa] PRIMARY KEY CLUSTERED 
(
	[taxon_id] ASC,
	[ref_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agents_hierarchy_entries]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents_hierarchy_entries](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[agent_role_id] [tinyint] NOT NULL,
	[view_order] [tinyint] NOT NULL,
 CONSTRAINT [PK_agents_hierarchy_entries] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC,
	[agent_id] ASC,
	[agent_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[resource_agent_roles]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource_agent_roles](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_resource_agent_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agents_resources]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents_resources](
	[agent_id] [bigint] NOT NULL,
	[resource_id] [bigint] NOT NULL,
	[resource_agent_role_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_agents_resources] PRIMARY KEY CLUSTERED 
(
	[agent_id] ASC,
	[resource_id] ASC,
	[resource_agent_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[resource_statuses]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource_statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_resource_statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agents_synonyms]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents_synonyms](
	[synonym_id] [bigint] NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[agent_role_id] [tinyint] NOT NULL,
	[view_order] [tinyint] NOT NULL,
 CONSTRAINT [PK_agents_synonyms] PRIMARY KEY CLUSTERED 
(
	[synonym_id] ASC,
	[agent_id] ASC,
	[agent_role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[resources]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resources](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](765) NOT NULL,
	[accesspoint_url] [nvarchar](765) NULL,
	[metadata_url] [nvarchar](765) NULL,
	[service_type_id] [int] NOT NULL DEFAULT ((1)),
	[service_version] [nvarchar](765) NULL,
	[resource_set_code] [nvarchar](765) NULL,
	[description] [nvarchar](765) NULL,
	[logo_url] [nvarchar](765) NULL,
	[language_id] [int] NULL,
	[subject] [nvarchar](765) NOT NULL,
	[bibliographic_citation] [nvarchar](1200) NULL,
	[license_id] [tinyint] NOT NULL,
	[rights_statement] [nvarchar](1200) NULL,
	[rights_holder] [nvarchar](765) NULL,
	[refresh_period_hours] [int] NULL,
	[resource_modified_at] [datetime] NULL,
	[resource_created_at] [datetime] NULL,
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[harvested_at] [datetime] NULL,
	[dataset_file_name] [nvarchar](765) NULL,
	[dataset_content_type] [nvarchar](765) NULL,
	[dataset_file_size] [int] NULL,
	[resource_status_id] [int] NULL,
	[auto_publish] [smallint] NOT NULL DEFAULT ((0)),
	[vetted] [smallint] NOT NULL DEFAULT ((0)),
	[notes] [ntext] NULL,
 CONSTRAINT [PK_resources] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[audiences]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audiences](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_audiences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[audiences_data_objects]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audiences_data_objects](
	[data_object_id] [bigint] NOT NULL,
	[audience_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_audiences_data_objects] PRIMARY KEY CLUSTERED 
(
	[data_object_id] ASC,
	[audience_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[canonical_forms]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[canonical_forms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[string] [nvarchar](900) NOT NULL,
 CONSTRAINT [PK_canonical_forms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[resources_taxa]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resources_taxa](
	[resource_id] [bigint] NOT NULL,
	[taxon_id] [bigint] NOT NULL,
	[identifier] [nvarchar](765) NOT NULL,
	[source_url] [nvarchar](765) NOT NULL,
	[taxon_created_at] [datetime] NULL,
	[taxon_modified_at] [datetime] NULL,
 CONSTRAINT [PK_resources_taxa] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC,
	[taxon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[clean_names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_names](
	[name_id] [bigint] NOT NULL,
	[clean_name] [nvarchar](900) NOT NULL,
 CONSTRAINT [PK_clean_names] PRIMARY KEY CLUSTERED 
(
	[name_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[service_types]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_types](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_service_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[collection_types]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collection_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[lft] [int] NULL,
	[rgt] [int] NULL,
	[label] [nvarchar](900) NOT NULL,
 CONSTRAINT [PK_collection_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[statuses]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[collection_types_collections]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collection_types_collections](
	[collection_type_id] [int] NOT NULL,
	[collection_id] [int] NOT NULL,
 CONSTRAINT [PK_collection_types_collections] PRIMARY KEY CLUSTERED 
(
	[collection_type_id] ASC,
	[collection_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[synonym_relations]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[synonym_relations](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_synonym_relations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[collections]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[resource_id] [int] NULL,
	[title] [nvarchar](450) NOT NULL,
	[description] [nvarchar](900) NOT NULL,
	[uri] [nvarchar](765) NOT NULL,
	[link] [nvarchar](765) NOT NULL,
	[logo_cache_url] [float] NULL,
	[vetted] [tinyint] NOT NULL,
	[ping_host_url] [nvarchar](765) NULL,
 CONSTRAINT [PK_collections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[synonyms]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[synonyms](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name_id] [bigint] NOT NULL,
	[synonym_relation_id] [tinyint] NOT NULL,
	[language_id] [int] NOT NULL,
	[hierarchy_entry_id] [bigint] NOT NULL,
	[preferred] [tinyint] NOT NULL,
	[hierarchy_id] [int] NOT NULL,
 CONSTRAINT [PK_synonyms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[common_names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[common_names](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[common_name] [nvarchar](765) NOT NULL,
	[language_id] [int] NOT NULL,
 CONSTRAINT [PK_common_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[table_of_contents]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[table_of_contents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[label] [nvarchar](765) NOT NULL,
	[view_order] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_table_of_contents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[common_names_taxa]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[common_names_taxa](
	[taxon_id] [bigint] NOT NULL,
	[common_name_id] [bigint] NOT NULL,
 CONSTRAINT [PK_common_names_taxa] PRIMARY KEY CLUSTERED 
(
	[taxon_id] ASC,
	[common_name_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxa]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxa](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[guid] [nvarchar](96) NOT NULL,
	[taxon_kingdom] [nvarchar](765) NOT NULL,
	[taxon_phylum] [nvarchar](765) NOT NULL,
	[taxon_class] [nvarchar](765) NOT NULL,
	[taxon_order] [nvarchar](765) NOT NULL,
	[taxon_family] [nvarchar](765) NOT NULL,
	[scientific_name] [nvarchar](765) NOT NULL,
	[name_id] [bigint] NOT NULL,
	[hierarchy_entry_id] [bigint] NOT NULL,
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_taxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[content_partner_agreements]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_partner_agreements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agent_id] [int] NOT NULL,
	[template] [ntext] NOT NULL,
	[is_current] [smallint] NOT NULL DEFAULT ((1)),
	[number_of_views] [int] NOT NULL DEFAULT ((0)),
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[last_viewed] [datetime] NULL,
	[mou_url] [nvarchar](765) NULL,
	[ip_address] [nvarchar](765) NULL,
	[signed_on_date] [datetime] NULL,
	[signed_by] [nvarchar](765) NULL,
 CONSTRAINT [PK_content_partner_agreements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxon_concept_content]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxon_concept_content](
	[taxon_concept_id] [bigint] NOT NULL,
	[text] [tinyint] NOT NULL,
	[image] [tinyint] NOT NULL,
	[child_image] [tinyint] NOT NULL,
	[flash] [tinyint] NOT NULL,
	[youtube] [tinyint] NOT NULL,
	[internal_image] [tinyint] NOT NULL,
	[gbif_image] [tinyint] NOT NULL,
	[content_level] [tinyint] NOT NULL,
	[image_object_id] [bigint] NOT NULL,
 CONSTRAINT [PK_taxon_concept_content] PRIMARY KEY CLUSTERED 
(
	[taxon_concept_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[content_partners]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_partners](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[agent_id] [int] NOT NULL,
	[description_of_data] [ntext] NULL,
	[partner_seen_step] [datetime] NULL,
	[partner_complete_step] [datetime] NULL,
	[contacts_seen_step] [datetime] NULL,
	[contacts_complete_step] [datetime] NULL,
	[licensing_seen_step] [datetime] NULL,
	[licensing_complete_step] [datetime] NULL,
	[attribution_seen_step] [datetime] NULL,
	[attribution_complete_step] [datetime] NULL,
	[roles_seen_step] [datetime] NULL,
	[roles_complete_step] [datetime] NULL,
	[transfer_overview_seen_step] [datetime] NULL,
	[transfer_overview_complete_step] [datetime] NULL,
	[transfer_upload_seen_step] [datetime] NULL,
	[transfer_upload_complete_step] [datetime] NULL,
	[specialist_overview_seen_step] [datetime] NULL,
	[specialist_overview_complete_step] [datetime] NULL,
	[specialist_formatting_seen_step] [datetime] NULL,
	[specialist_formatting_complete_step] [datetime] NULL,
	[vetted] [smallint] NOT NULL DEFAULT ((0)),
	[description] [ntext] NOT NULL,
	[last_completed_step] [nvarchar](120) NULL,
	[notes] [ntext] NOT NULL,
	[ipr_accept] [smallint] NOT NULL DEFAULT ((0)),
	[attribution_accept] [smallint] NOT NULL DEFAULT ((0)),
	[roles_accept] [smallint] NOT NULL DEFAULT ((0)),
	[transfer_schema_accept] [smallint] NOT NULL DEFAULT ((0)),
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[updated_at] [datetime] NULL,
	[eol_notified_of_acceptance] [datetime] NULL,
	[auto_publish] [smallint] NOT NULL DEFAULT ((0)),
	[show_on_partner_page] [smallint] NOT NULL DEFAULT ((0)),
	[show_mou_on_partner_page] [smallint] NOT NULL DEFAULT ((0)),
	[admin_notes] [ntext] NULL,
 CONSTRAINT [PK_content_partners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxon_concept_content_test]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxon_concept_content_test](
	[taxon_concept_id] [bigint] NOT NULL,
	[text] [tinyint] NOT NULL,
	[text_unpublished] [tinyint] NOT NULL,
	[image] [tinyint] NOT NULL,
	[image_unpublished] [tinyint] NOT NULL,
	[child_image] [tinyint] NOT NULL,
	[child_image_unpublished] [tinyint] NOT NULL,
	[video] [tinyint] NOT NULL,
	[video_unpublished] [tinyint] NOT NULL,
	[map] [tinyint] NOT NULL,
	[map_unpublished] [tinyint] NOT NULL,
	[content_level] [tinyint] NOT NULL,
	[image_object_id] [bigint] NOT NULL,
 CONSTRAINT [PK_taxon_concept_content_test] PRIMARY KEY CLUSTERED 
(
	[taxon_concept_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxon_concept_names]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxon_concept_names](
	[taxon_concept_id] [bigint] NOT NULL,
	[name_id] [bigint] NOT NULL,
	[source_hierarchy_entry_id] [bigint] NOT NULL,
	[language_id] [bigint] NOT NULL,
	[vern] [tinyint] NOT NULL,
	[preferred] [tinyint] NOT NULL,
 CONSTRAINT [PK_taxon_concept_names] PRIMARY KEY CLUSTERED 
(
	[taxon_concept_id] ASC,
	[name_id] ASC,
	[source_hierarchy_entry_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxon_concept_relationships]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxon_concept_relationships](
	[taxon_concept_id_1] [bigint] NOT NULL,
	[taxon_concept_id_2] [bigint] NOT NULL,
	[relationship] [nvarchar](90) NOT NULL,
	[score] [float] NOT NULL,
	[extra] [ntext] NOT NULL,
 CONSTRAINT [PK_taxon_concept_relationships] PRIMARY KEY CLUSTERED 
(
	[taxon_concept_id_1] ASC,
	[taxon_concept_id_2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[taxon_concepts]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxon_concepts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[supercedure_id] [bigint] NOT NULL,
	[vetted_id] [tinyint] NOT NULL DEFAULT ((0)),
	[published] [tinyint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_taxon_concepts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[title_items]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title_items](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[publication_title_id] [bigint] NOT NULL,
	[bar_code] [nvarchar](150) NOT NULL,
	[marc_item_id] [nvarchar](150) NOT NULL,
	[call_number] [nvarchar](300) NOT NULL,
	[volume_info] [nvarchar](300) NOT NULL,
	[url] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_title_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[guid] [nvarchar](96) NOT NULL,
	[data_type_id] [int] NOT NULL,
	[mime_type_id] [int] NOT NULL,
	[object_title] [nvarchar](765) NOT NULL,
	[language_id] [int] NOT NULL,
	[license_id] [tinyint] NOT NULL,
	[rights_statement] [nvarchar](900) NOT NULL,
	[rights_holder] [nvarchar](765) NOT NULL,
	[bibliographic_citation] [nvarchar](900) NOT NULL,
	[source_url] [nvarchar](765) NOT NULL,
	[description] [ntext] NOT NULL,
	[description_linked] [ntext] NULL,
	[object_url] [nvarchar](765) NOT NULL,
	[object_cache_url] [float] NULL,
	[thumbnail_url] [nvarchar](765) NOT NULL,
	[thumbnail_cache_url] [float] NULL,
	[location] [nvarchar](765) NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[altitude] [float] NOT NULL,
	[object_created_at] [datetime] NULL,
	[object_modified_at] [datetime] NULL,
	[created_at] [datetime] NOT NULL DEFAULT (''),
	[updated_at] [datetime] NULL,
	[data_rating] [real] NOT NULL DEFAULT ((2.5)),
	[vetted_id] [tinyint] NOT NULL,
	[visibility_id] [int] NULL,
	[published] [smallint] NOT NULL DEFAULT ((0)),
	[curated] [smallint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_data_objects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[top_images]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[top_images](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[data_object_id] [bigint] NOT NULL,
	[view_order] [int] NOT NULL,
 CONSTRAINT [PK_top_images] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC,
	[data_object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[top_unpublished_images]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[top_unpublished_images](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[data_object_id] [bigint] NOT NULL,
	[view_order] [int] NOT NULL,
 CONSTRAINT [PK_top_unpublished_images] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC,
	[data_object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[untrust_reasons]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[untrust_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_untrust_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_harvest_events]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_harvest_events](
	[harvest_event_id] [bigint] NOT NULL,
	[data_object_id] [bigint] NOT NULL,
	[guid] [nvarchar](96) NOT NULL,
	[status_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_data_objects_harvest_events] PRIMARY KEY CLUSTERED 
(
	[harvest_event_id] ASC,
	[data_object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[vetted]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vetted](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_vetted] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_info_items]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_info_items](
	[data_object_id] [bigint] NOT NULL,
	[info_item_id] [int] NOT NULL,
 CONSTRAINT [PK_data_objects_info_items] PRIMARY KEY CLUSTERED 
(
	[data_object_id] ASC,
	[info_item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[visibilities]    脚本日期: 10/30/2009 02:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visibilities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_visibilities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_refs]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_refs](
	[data_object_id] [bigint] NOT NULL,
	[ref_id] [bigint] NOT NULL,
 CONSTRAINT [PK_data_objects_refs] PRIMARY KEY CLUSTERED 
(
	[data_object_id] ASC,
	[ref_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_table_of_contents]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_table_of_contents](
	[data_object_id] [bigint] NOT NULL,
	[toc_id] [int] NOT NULL,
 CONSTRAINT [PK_data_objects_table_of_contents] PRIMARY KEY CLUSTERED 
(
	[data_object_id] ASC,
	[toc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_taxa]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_taxa](
	[taxon_id] [bigint] NOT NULL,
	[data_object_id] [bigint] NOT NULL,
	[identifier] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_data_objects_taxa] PRIMARY KEY CLUSTERED 
(
	[taxon_id] ASC,
	[data_object_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_objects_untrust_reasons]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_objects_untrust_reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data_object_id] [int] NULL,
	[untrust_reason_id] [int] NULL,
 CONSTRAINT [PK_data_objects_untrust_reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[data_types]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[schema_value] [nvarchar](765) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_data_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[harvest_events]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[harvest_events](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[resource_id] [nvarchar](300) NOT NULL,
	[began_at] [datetime] NOT NULL DEFAULT (''),
	[completed_at] [datetime] NULL,
	[published_at] [datetime] NULL,
 CONSTRAINT [PK_harvest_events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[harvest_events_taxa]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[harvest_events_taxa](
	[harvest_event_id] [bigint] NOT NULL,
	[taxon_id] [bigint] NOT NULL,
	[guid] [nvarchar](96) NOT NULL,
	[status_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_harvest_events_taxa] PRIMARY KEY CLUSTERED 
(
	[harvest_event_id] ASC,
	[taxon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchies]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchies](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[label] [nvarchar](765) NOT NULL,
	[description] [ntext] NOT NULL,
	[indexed_on] [datetime] NOT NULL DEFAULT (''),
	[hierarchy_group_id] [bigint] NOT NULL,
	[hierarchy_group_version] [tinyint] NOT NULL,
	[url] [nvarchar](765) NOT NULL,
	[browsable] [int] NULL,
 CONSTRAINT [PK_hierarchies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchies_content]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchies_content](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[text] [tinyint] NOT NULL,
	[image] [tinyint] NOT NULL,
	[child_image] [tinyint] NOT NULL,
	[flash] [tinyint] NOT NULL,
	[youtube] [tinyint] NOT NULL,
	[internal_image] [tinyint] NOT NULL,
	[gbif_image] [tinyint] NOT NULL,
	[content_level] [tinyint] NOT NULL,
	[image_object_id] [bigint] NOT NULL,
 CONSTRAINT [PK_hierarchies_content] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchies_content_test]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchies_content_test](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[text] [tinyint] NOT NULL,
	[text_unpublished] [tinyint] NOT NULL,
	[image] [tinyint] NOT NULL,
	[image_unpublished] [tinyint] NOT NULL,
	[child_image] [tinyint] NOT NULL,
	[child_image_unpublished] [tinyint] NOT NULL,
	[video] [tinyint] NOT NULL,
	[video_unpublished] [tinyint] NOT NULL,
	[map] [tinyint] NOT NULL,
	[map_unpublished] [tinyint] NOT NULL,
	[content_level] [tinyint] NOT NULL,
	[image_object_id] [bigint] NOT NULL,
 CONSTRAINT [PK_hierarchies_content_test] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchies_resources]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchies_resources](
	[resource_id] [bigint] NOT NULL,
	[hierarchy_id] [bigint] NOT NULL,
 CONSTRAINT [PK_hierarchies_resources] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchy_entries]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchy_entries](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[identifier] [nvarchar](765) NOT NULL,
	[name_id] [bigint] NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[hierarchy_id] [int] NOT NULL,
	[rank_id] [int] NOT NULL,
	[ancestry] [nvarchar](1500) NOT NULL,
	[lft] [bigint] NOT NULL,
	[rgt] [bigint] NOT NULL,
	[depth] [tinyint] NOT NULL,
	[taxon_concept_id] [bigint] NOT NULL,
 CONSTRAINT [PK_hierarchy_entries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchy_entry_names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchy_entry_names](
	[hierarchy_entry_id] [bigint] NOT NULL,
	[italics] [nvarchar](900) NOT NULL,
	[italics_canonical] [nvarchar](900) NOT NULL,
	[normal] [nvarchar](900) NOT NULL,
	[normal_canonical] [nvarchar](900) NOT NULL,
	[common_name_en] [nvarchar](900) NOT NULL,
	[common_name_fr] [nvarchar](900) NOT NULL,
 CONSTRAINT [PK_hierarchy_entry_names] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[hierarchy_entry_relationships]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hierarchy_entry_relationships](
	[hierarchy_entry_id_1] [bigint] NOT NULL,
	[hierarchy_entry_id_2] [bigint] NOT NULL,
	[relationship] [nvarchar](90) NOT NULL,
	[score] [float] NOT NULL,
	[extra] [ntext] NOT NULL,
 CONSTRAINT [PK_hierarchy_entry_relationships] PRIMARY KEY CLUSTERED 
(
	[hierarchy_entry_id_1] ASC,
	[hierarchy_entry_id_2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[info_items]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[schema_value] [nvarchar](765) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
	[toc_id] [int] NOT NULL,
 CONSTRAINT [PK_info_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[item_pages]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_pages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title_item_id] [bigint] NOT NULL,
	[year] [nvarchar](60) NOT NULL,
	[volume] [nvarchar](60) NOT NULL,
	[issue] [nvarchar](60) NOT NULL,
	[prefix] [nvarchar](60) NOT NULL,
	[number] [nvarchar](60) NOT NULL,
	[url] [nvarchar](765) NOT NULL,
	[page_type] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_item_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[languages]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[iso_639_1] [nvarchar](18) NOT NULL,
	[iso_639_2] [nvarchar](18) NOT NULL,
	[iso_639_3] [nvarchar](18) NOT NULL,
	[source_form] [nvarchar](300) NOT NULL,
	[sort_order] [smallint] NOT NULL DEFAULT ((1)),
	[activated_on] [datetime] NULL,
 CONSTRAINT [PK_languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[licenses]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licenses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](765) NOT NULL,
	[description] [nvarchar](1200) NOT NULL,
	[source_url] [nvarchar](765) NOT NULL,
	[version] [nvarchar](18) NOT NULL,
	[logo_url] [nvarchar](765) NOT NULL,
	[show_to_content_partners] [smallint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_licenses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[mappings]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mappings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[collection_id] [int] NOT NULL,
	[name_id] [bigint] NOT NULL,
	[foreign_key] [nvarchar](1800) NOT NULL,
 CONSTRAINT [PK_mappings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[mime_types]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mime_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_mime_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[name_languages]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[name_languages](
	[name_id] [bigint] NOT NULL,
	[language_id] [int] NOT NULL,
	[parent_name_id] [bigint] NOT NULL,
	[preferred] [tinyint] NOT NULL,
 CONSTRAINT [PK_name_languages] PRIMARY KEY CLUSTERED 
(
	[name_id] ASC,
	[language_id] ASC,
	[parent_name_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[names](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[namebank_id] [bigint] NOT NULL,
	[string] [nvarchar](900) NOT NULL,
	[italicized] [nvarchar](900) NOT NULL,
	[italicized_verified] [tinyint] NOT NULL,
	[canonical_form_id] [bigint] NOT NULL,
	[canonical_verified] [tinyint] NOT NULL,
 CONSTRAINT [PK_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[normalized_links]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[normalized_links](
	[normalized_name_id] [bigint] NOT NULL,
	[name_id] [bigint] NOT NULL,
	[seq] [tinyint] NOT NULL,
	[normalized_qualifier_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_normalized_links] PRIMARY KEY CLUSTERED 
(
	[normalized_name_id] ASC,
	[name_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[normalized_names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[normalized_names](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name_part] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_normalized_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[normalized_qualifiers]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[normalized_qualifiers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_normalized_qualifiers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[page_names]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_names](
	[item_page_id] [bigint] NOT NULL,
	[name_id] [bigint] NOT NULL,
 CONSTRAINT [PK_page_names] PRIMARY KEY CLUSTERED 
(
	[name_id] ASC,
	[item_page_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[page_stats_dataobjects]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_stats_dataobjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [nvarchar](3) NULL DEFAULT ('n'),
	[taxa_count] [int] NULL,
	[vetted_unknown_published_visible_uniqueGuid] [int] NULL,
	[vetted_untrusted_published_visible_uniqueGuid] [int] NULL,
	[vetted_unknown_published_notVisible_uniqueGuid] [int] NULL,
	[vetted_untrusted_published_notVisible_uniqueGuid] [int] NULL,
	[date_created] [datetime] NULL,
	[time_created] [datetime] NULL,
	[timestamp] [datetime] NOT NULL DEFAULT (''),
	[a_vetted_unknown_published_visible_uniqueGuid] [ntext] NULL,
	[a_vetted_untrusted_published_visible_uniqueGuid] [ntext] NULL,
	[a_vetted_unknown_published_notVisible_uniqueGuid] [ntext] NULL,
	[a_vetted_untrusted_published_notVisible_uniqueGuid] [ntext] NULL,
 CONSTRAINT [PK_page_stats_dataobjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[page_stats_marine]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_stats_marine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [smallint] NULL DEFAULT ((0)),
	[names_from_xml] [int] NULL,
	[names_in_eol] [int] NULL,
	[marine_pages] [int] NULL,
	[pages_with_objects] [int] NULL,
	[pages_with_vetted_objects] [int] NULL,
	[date_created] [datetime] NULL,
	[time_created] [datetime] NULL,
	[timestamp] [datetime] NOT NULL DEFAULT (''),
 CONSTRAINT [PK_page_stats_marine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[page_stats_taxa]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_stats_taxa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[active] [nvarchar](3) NULL DEFAULT ('n'),
	[taxa_count] [int] NULL,
	[taxa_text] [int] NULL,
	[taxa_images] [int] NULL,
	[taxa_text_images] [int] NULL,
	[taxa_BHL_no_text] [int] NULL,
	[taxa_links_no_text] [int] NULL,
	[taxa_images_no_text] [int] NULL,
	[taxa_text_no_images] [int] NULL,
	[vet_obj_only_1cat_inCOL] [int] NULL,
	[vet_obj_only_1cat_notinCOL] [int] NULL,
	[vet_obj_morethan_1cat_inCOL] [int] NULL,
	[vet_obj_morethan_1cat_notinCOL] [int] NULL,
	[vet_obj] [int] NULL,
	[no_vet_obj2] [int] NULL,
	[with_BHL] [int] NULL,
	[vetted_not_published] [int] NULL,
	[vetted_unknown_published_visible_inCol] [int] NULL,
	[vetted_unknown_published_visible_notinCol] [int] NULL,
	[date_created] [datetime] NULL,
	[time_created] [datetime] NULL,
	[pages_incol] [int] NULL,
	[pages_not_incol] [int] NULL,
	[a_taxa_with_text] [ntext] NULL,
	[timestamp] [datetime] NOT NULL DEFAULT (''),
	[a_vetted_not_published] [ntext] NULL,
	[a_vetted_unknown_published_visible_notinCol] [ntext] NULL,
	[a_vetted_unknown_published_visible_inCol] [ntext] NULL,
 CONSTRAINT [PK_page_stats_taxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_contact_roles]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_contact_roles](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_agent_contact_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[publication_titles]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publication_titles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[marc_bib_id] [nvarchar](120) NOT NULL,
	[marc_leader] [nvarchar](120) NOT NULL,
	[title] [nvarchar](900) NOT NULL,
	[short_title] [nvarchar](900) NOT NULL,
	[details] [nvarchar](900) NOT NULL,
	[call_number] [nvarchar](120) NOT NULL,
	[start_year] [nvarchar](30) NOT NULL,
	[end_year] [nvarchar](30) NOT NULL,
	[language] [nvarchar](30) NOT NULL,
	[author] [nvarchar](450) NOT NULL,
	[abbreviation] [nvarchar](450) NOT NULL,
	[url] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_publication_titles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_contacts]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_contacts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[agent_id] [bigint] NOT NULL,
	[agent_contact_role_id] [tinyint] NOT NULL,
	[full_name] [nvarchar](765) NOT NULL,
	[title] [nvarchar](60) NOT NULL,
	[given_name] [nvarchar](765) NOT NULL,
	[family_name] [nvarchar](765) NOT NULL,
	[homepage] [nvarchar](765) NOT NULL,
	[email] [nvarchar](225) NOT NULL,
	[telephone] [nvarchar](90) NOT NULL,
	[address] [ntext] NOT NULL,
 CONSTRAINT [PK_agent_contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[random_hierarchy_images]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[random_hierarchy_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data_object_id] [int] NOT NULL,
	[hierarchy_entry_id] [int] NULL,
	[hierarchy_id] [int] NULL,
	[taxon_concept_id] [int] NULL,
	[name] [nvarchar](765) NOT NULL,
 CONSTRAINT [PK_random_hierarchy_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[agent_data_types]    脚本日期: 10/30/2009 02:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agent_data_types](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_agent_data_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
