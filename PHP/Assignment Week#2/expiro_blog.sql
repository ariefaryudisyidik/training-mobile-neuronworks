-- phpMyAdmin SQL Dump
-- version 4.9.10
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 05:44 AM
-- Server version: 5.7.39
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expiro_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Web Programming', 'web-programming', '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(2, 'Web Design', 'web-design', '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(3, 'Personal', 'personal', '2023-06-04 03:22:09', '2023-06-04 03:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_28_065219_create_posts_table', 1),
(6, '2023_05_28_101629_create_categories_table', 1),
(7, '2023_06_05_031031_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Similique tempore et et repudiandae quibusdam.', 'temporibus-beatae-ut-ipsa-sed-illum-vel', NULL, 'Eaque dolore enim et praesentium excepturi aut repellat iste. Odit cum quisquam quibusdam possimus. Et facilis laborum enim officiis repellendus accusantium.', '<p>Ullam cum ipsa voluptatem et. Et ut voluptates molestias libero rerum porro repellendus doloremque. Temporibus velit nisi quaerat atque ea. Voluptates voluptatum dicta neque sed optio.</p><p>Velit deserunt rerum et quod praesentium culpa quas. Velit debitis velit repellendus sint autem dolore. Molestias pariatur laborum aut culpa ut et. Asperiores similique voluptates impedit laborum facilis dolores.</p><p>Nesciunt aut quia sit deserunt. Nihil inventore sequi error aut ut omnis. Dolores perspiciatis magni non recusandae et illo dolorem.</p><p>Omnis dignissimos dolores odit quidem aliquam dicta expedita. Magnam explicabo qui alias eligendi porro praesentium. Sequi facilis suscipit commodi iste.</p><p>Provident libero non explicabo excepturi eos. Optio eius non nihil maiores qui est ut. Officiis necessitatibus sunt quasi molestias.</p><p>Quos nihil architecto in similique. Nemo corrupti ut suscipit corporis delectus. Dolore illum aut saepe nesciunt labore voluptatibus debitis facilis. Reprehenderit dolorem saepe quisquam est quis.</p><p>Est eaque non dolores quis ratione. Quaerat qui adipisci et perferendis nesciunt exercitationem. Dolor omnis et corporis et a. Aut distinctio harum temporibus tenetur ut.</p><p>Rerum et ut rerum eos a ipsam fuga itaque. Voluptatem aut sequi deleniti libero veritatis ipsam quis. Doloribus eos facilis temporibus praesentium dolor et.</p><p>Est repellat consequatur debitis deserunt nobis. Saepe et molestiae rerum eaque recusandae doloribus. Nostrum et qui similique. Fugiat omnis libero doloremque nisi.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(2, 3, 3, 'Voluptas enim optio dolores rerum.', 'sit-quod-illo-commodi-quasi-sit', NULL, 'Sint error dolor est quae qui dolorem est qui. Sed itaque facere atque excepturi perferendis. Rerum ea ea autem laboriosam dolores dolor. Illo tempora mollitia et.', '<p>Voluptas aliquam est expedita maxime aut id ut. Sit ea velit molestiae eos qui mollitia modi. Molestiae eum illum quis omnis sunt quaerat quod ut. Sed praesentium quod et veritatis deserunt.</p><p>Quisquam praesentium sint numquam qui tenetur. Aut deleniti necessitatibus ut qui error sit. Quaerat minima necessitatibus sed molestiae. Ut cumque quod sint quos.</p><p>Temporibus veritatis quia nobis vero minus. Perspiciatis atque magni quisquam doloremque molestiae est. In aut libero provident rerum vitae.</p><p>Quia et nihil ea quaerat consequatur voluptatem. Qui sint repudiandae explicabo. Perspiciatis doloribus sequi autem et.</p><p>Voluptas omnis neque alias. Dolores quia tenetur corrupti velit. Sit ducimus asperiores voluptatem consequatur saepe.</p><p>Explicabo sunt perferendis ad est velit. Accusamus exercitationem ducimus iste et cumque. Ad id consequatur ad. Aspernatur debitis sunt inventore ipsa facere odio blanditiis.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(3, 1, 1, 'Et aut quis dolore voluptatem adipisci ut voluptas.', 'voluptatibus-et-impedit-vel-in', NULL, 'Tenetur provident numquam sunt vitae quis totam voluptate earum. Cupiditate fugit ea ut vitae. Qui ut eveniet vero distinctio culpa. Est enim occaecati ipsum ut eum nesciunt.', '<p>Cupiditate optio et et deserunt vitae sed. Et fugit sunt illo soluta impedit impedit. Ducimus aut enim rem quas incidunt. Rerum commodi qui nisi non ut vitae consequatur. Ullam et eum nihil id aut sed.</p><p>Ut et sit quaerat perferendis corrupti repudiandae qui. Omnis aspernatur magnam occaecati omnis esse. Explicabo corrupti quia ea repudiandae et ea minima vel. Occaecati velit nam magni aut fuga autem. Voluptatem quaerat est autem nesciunt laudantium enim.</p><p>Et non accusamus illo ullam. Facere natus quia tempora sequi officia cumque odio. Laboriosam et voluptatem illum beatae nisi doloremque. Est eveniet voluptatem voluptate in architecto.</p><p>Quia aperiam nobis qui magnam accusamus est. Omnis dolores unde atque non amet est voluptatem. Voluptas repudiandae ut totam fuga sit reprehenderit.</p><p>Maxime libero laboriosam fugit eum. Magni cupiditate et quis provident sunt provident ut. Eum maxime eum ut iure ab dolorem in laborum. Est doloremque non consequuntur qui ipsam temporibus nihil facere.</p><p>Commodi fugit dolorem eaque laudantium voluptatem. A saepe facere magnam vero. Dolores fuga sequi dolorem provident quo aliquam dolor. Deserunt ad dicta deleniti molestias consequatur aliquid minima.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(4, 1, 2, 'Cum deleniti.', 'laborum-dolorum-sed-vel-doloremque-pariatur-vero', NULL, 'Quaerat quas et velit sit sapiente ea. Sed cupiditate nisi ratione dicta ea alias. Et nesciunt et iure sequi.', '<p>Eligendi ut ipsa praesentium numquam dolorum. Numquam eos sed qui quia dolor. Tempore repellendus qui debitis sit ullam. Atque cumque est rerum quis.</p><p>Impedit vel aut itaque sit porro. Consectetur voluptatum doloremque aut adipisci inventore. Quia sit deserunt quisquam placeat minus sed numquam. Soluta in voluptatem optio dolorem doloribus omnis et cum.</p><p>Voluptas explicabo aut natus aut delectus magnam. Inventore architecto in aspernatur porro accusantium quos. Ipsum numquam voluptate consectetur non suscipit. Delectus et maiores impedit ex voluptatem.</p><p>Nisi maiores quia voluptatum debitis accusamus. Quia et rerum molestiae sunt. Harum qui autem fugit in accusantium ut voluptatem et. Ipsa ab quae quia doloremque sequi facilis. Assumenda et ratione sit fugit aut in nihil.</p><p>Delectus aspernatur eius earum dolor est temporibus velit. Quis laudantium eos quisquam aliquid laudantium ad. Quia aut quo in dolorum voluptatem iure veniam. Nemo et iure tenetur itaque.</p><p>Ut et perspiciatis ullam nisi. Facere voluptatem aliquam alias molestiae eligendi vel et. Cumque odio excepturi non ipsum. Laborum ut facilis aut rerum beatae rerum.</p><p>Quia molestiae omnis numquam quos magnam quod. Dolore non rerum repellat ad ut recusandae. Fugiat qui quod sunt non et. Quia in dicta porro nisi sapiente eum.</p><p>Dolorem dolores odio illum itaque dolor magnam. Ducimus vel voluptates nesciunt modi in. Aut aut ducimus animi error id consequatur. Aut atque at non. At consequuntur laudantium in nihil facere sapiente.</p><p>Distinctio repellat quis sunt occaecati beatae nisi. Voluptas beatae voluptatem nihil. Maiores ut ratione sint velit. Illum maxime consectetur officia.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(5, 3, 3, 'Cum facere et iusto qui et laborum.', 'iste-veritatis-eos-id-voluptate-aut-hic', NULL, 'Quisquam quia a ut. Autem quibusdam non vel corporis enim. Modi possimus et dicta quaerat soluta.', '<p>Autem sint debitis reiciendis aut dolor. At rem numquam et. Minus ut eius consectetur laudantium. Et porro quis adipisci suscipit reiciendis unde quibusdam.</p><p>Voluptatem aliquam occaecati totam dolore. Ducimus velit quam tempora qui ea dolores. Distinctio dolorem explicabo quia molestiae. Recusandae quod dolore quae corrupti ipsum maiores.</p><p>Saepe neque dolor vero quos consequatur. Amet aut et quo excepturi iure. Qui aut qui assumenda et impedit. Molestiae voluptates omnis similique ea est.</p><p>Fuga voluptatem et voluptas ea. Eius blanditiis consectetur sit eligendi. Amet atque maiores et veritatis porro. Qui eum sit excepturi debitis nam nesciunt. Perferendis placeat sint mollitia et magni.</p><p>Consectetur harum consectetur nisi. Veniam et et quia. Adipisci aliquam qui labore qui rerum rerum.</p><p>Non sint nemo ullam est velit. Molestias quaerat dicta cumque id. Dignissimos sit est est.</p><p>Odio et unde a reprehenderit molestias dolorem. Omnis et optio repellendus nemo iure molestiae molestiae nulla.</p><p>Amet molestias excepturi voluptatem rerum rerum quibusdam doloribus distinctio. Dolor et nihil eveniet. Omnis officiis sunt ad aliquam quasi numquam at. Dolores ad rerum atque nulla. Dolores mollitia cupiditate assumenda laborum possimus rerum sit.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(6, 1, 3, 'Accusamus eius voluptatum voluptatem fuga ad amet consequatur beatae voluptas.', 'voluptas-velit-exercitationem-impedit-sit-sint-vel-nisi', NULL, 'Laudantium neque eius quia ullam. Laboriosam saepe ut similique velit. Repudiandae doloribus asperiores quibusdam et sequi. Veritatis atque excepturi distinctio animi.', '<p>Dicta et aliquam nesciunt saepe autem. Quo ipsam excepturi aut quis dolor facilis. Deleniti dignissimos repellat assumenda quia.</p><p>Perferendis deserunt porro qui et suscipit. Dolorem dolore quis et provident dolores consequuntur. Sint quos est itaque debitis quia. In incidunt esse vel ut.</p><p>Ut aperiam animi a aut nisi. Veritatis voluptatibus ut dolor dolorem nobis accusamus. Fugiat laudantium voluptatem nostrum enim nulla est voluptate. Voluptatem minima assumenda pariatur quidem et doloremque velit.</p><p>Qui voluptatem est totam qui facilis recusandae consectetur. Ipsum occaecati minima ut explicabo accusamus qui. Est ut nesciunt tempora accusantium voluptatem enim.</p><p>Voluptatem eius ad praesentium nemo in ducimus itaque. Est dolorem ipsa tenetur omnis quaerat ex nesciunt. Culpa enim soluta voluptas corporis.</p><p>Voluptate beatae doloremque omnis in aperiam deserunt rerum. Magni ullam rem voluptatem doloribus nam sed. Qui harum ad quam non.</p><p>Facilis et ratione enim maiores in. Sed molestias aut consequatur earum. Est soluta voluptate voluptatem ea corrupti libero asperiores. Est in iste facere deserunt repellat error itaque.</p><p>Cumque sunt aliquam at. Dolorem ex quam sit expedita mollitia. Explicabo sit et facere maiores omnis qui.</p><p>Et itaque consequatur deserunt itaque. Et explicabo earum magni neque. Vitae hic est beatae et dignissimos. Ratione aut quas autem quasi necessitatibus qui.</p><p>Voluptas ipsa alias quis molestiae vero in. Nam et ut iure culpa. Rerum sunt vel enim sit id qui.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(7, 1, 3, 'Quia ut molestiae autem.', 'eum-minus-eum-natus-perferendis', NULL, 'Rerum velit non ex ex. Doloribus aut molestias iure iusto. Ut voluptatem similique optio voluptatem sequi sunt labore. Nam omnis enim nobis tempora magni esse. Excepturi dolores facere aliquid reiciendis aut quasi debitis non.', '<p>Rem placeat quia autem est ex non. Culpa nesciunt temporibus et et quidem velit est. Sapiente tempore quia et.</p><p>Sapiente eum rerum corporis voluptatem rerum magni. Modi enim autem vitae animi veritatis. Eos qui similique tempora fugit nihil ut. Quia repudiandae repellendus placeat quo sapiente.</p><p>Aut dolor molestias iusto. Eaque quisquam dolorum delectus id eum. Omnis molestiae nobis quod qui in iusto beatae.</p><p>Corporis necessitatibus possimus eos quo omnis officia. Placeat voluptatem animi inventore debitis maiores. A cupiditate minus sit consectetur et at autem. Aut saepe placeat necessitatibus adipisci.</p><p>Adipisci quam sint aperiam ipsa tempora. Modi dolorum temporibus est atque hic est laudantium veniam. Praesentium mollitia magnam deleniti dolor ut. Cum non facere amet optio dolores tempore.</p><p>Qui maiores aut esse maxime expedita voluptates doloribus. Expedita est qui autem. Repellendus sed ut sed sed. Libero aliquid iusto dolor illum eum.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(8, 1, 3, 'Quo molestiae quaerat est praesentium ut aut.', 'alias-minima-debitis-quisquam-nam-placeat', NULL, 'Et et a id omnis a sed nihil. Itaque est neque rerum.', '<p>Ad labore corporis distinctio voluptas. Et totam mollitia animi debitis maiores. Vel illo et recusandae aut tenetur similique aut. Debitis consequatur ipsum explicabo ut. Temporibus et nam quas.</p><p>Voluptatum eaque voluptatem consequatur quis. Eum inventore sint et dicta possimus harum. Ullam incidunt quo error voluptate non fugiat. Eveniet ullam quas quos id rerum enim est.</p><p>Quaerat earum dignissimos et dicta laborum. Iusto maxime corporis numquam nostrum alias aliquam. Dignissimos veniam exercitationem et ea id dolor possimus possimus. Omnis odio et suscipit ab ab nobis qui et.</p><p>Facere eius enim in quia. Praesentium placeat laboriosam nostrum aliquam voluptatem alias.</p><p>Fugiat omnis dolor totam dolor sunt fugit dicta. Esse aut quam et quasi. Velit iste voluptas minima ducimus est.</p><p>Voluptatibus nostrum in dignissimos sint omnis. Quia accusantium animi laboriosam. Beatae non esse minus eligendi facilis.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(9, 3, 2, 'Sapiente eum.', 'officiis-voluptatem-magnam-saepe-sint-officiis-non-blanditiis', NULL, 'Ex quam soluta reprehenderit possimus laudantium quos impedit. In doloribus saepe non illo in expedita. Pariatur nobis porro aliquid provident omnis. Fuga saepe voluptas placeat sed officiis et quis.', '<p>Quae aut ducimus id distinctio repudiandae rerum. Eius iste ducimus et vitae quia. Illum rem rerum facilis quod et. Tempore expedita libero quis blanditiis porro inventore voluptas.</p><p>Minus ex enim quam magnam saepe. Delectus excepturi ducimus cupiditate veniam nam sit et. Sunt voluptatem minima eos ut nesciunt. Dolores odio dicta enim voluptatem et enim ea.</p><p>Occaecati est rem reiciendis et. Quod odio sapiente repellendus in autem libero dolores. Adipisci enim voluptates eum eligendi aut nesciunt et. Eligendi enim nostrum porro.</p><p>Sint quod ut ipsam fugit voluptas suscipit nulla. Non deserunt similique eveniet voluptas voluptatem voluptatem non. Pariatur voluptatem et est omnis natus. Sunt consequatur consequatur harum.</p><p>Labore maxime id iusto. Fuga dolores fugit esse quam. Ullam veritatis vero rerum omnis ut quas. Nemo voluptas nemo eum exercitationem.</p><p>Veniam quo fugiat velit et necessitatibus. Ipsum quisquam eligendi nemo veniam illo suscipit ipsam. Dolor porro placeat error consectetur quo sint.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(10, 3, 3, 'Animi officia praesentium facere odio rerum sint fuga voluptatem.', 'ut-saepe-aut-ut-voluptas-porro', NULL, 'Dolorem aut deserunt eos voluptatem magnam voluptas. Autem quis tenetur aut earum. Doloribus suscipit totam eum similique quo natus velit. Est omnis voluptatem temporibus asperiores totam.', '<p>Ea aliquid molestiae velit aut eligendi accusamus. Quod quisquam consequatur et non. Inventore ea iure totam. Laborum non dolore ad ipsam.</p><p>Ab sed aut dolore placeat. Est aut rem accusantium repellat ab qui quae.</p><p>Labore sed consectetur incidunt sed. Repellendus corrupti corrupti fugiat.</p><p>Reprehenderit ipsum accusantium voluptate fuga qui magnam enim. Facilis doloremque est reiciendis vel ullam sint reiciendis iure.</p><p>Voluptas aut dolor reiciendis ea qui maiores. Ea dolorum corrupti non enim molestiae alias. Velit consequuntur occaecati eligendi. Doloribus distinctio suscipit sed modi quam.</p><p>Qui voluptas unde aut expedita optio perferendis aperiam voluptatem. Occaecati autem aut eligendi quia.</p><p>Quibusdam facilis qui quas modi sapiente id. Labore et non numquam perferendis sed impedit. Similique numquam autem ut ex deleniti. Eos non rerum aperiam tenetur architecto non ratione perspiciatis.</p><p>Exercitationem vitae consectetur dolores cum numquam non. Aperiam cum ut reiciendis cumque animi inventore. Ut laboriosam placeat reprehenderit eos est accusamus. Quidem commodi earum aperiam autem porro quas.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(11, 2, 3, 'Quos et magni qui.', 'maiores-magnam-beatae-culpa-ducimus-voluptas-maiores-et', NULL, 'Ut illo iusto aut dolorem ut necessitatibus. Quia occaecati sit a impedit. Aut eveniet in natus magnam enim rem enim odit.', '<p>Occaecati nulla totam pariatur. Est et ipsam quaerat occaecati vel sint at. Ipsum in ut dolores voluptas deleniti. Illo aperiam inventore earum reprehenderit pariatur voluptatem.</p><p>Enim temporibus deleniti et tenetur commodi non. Molestiae libero sed eos expedita quidem. Incidunt corporis atque provident recusandae et eaque exercitationem et.</p><p>Tempora sunt quos aperiam. Maiores sint praesentium nam aut quaerat. Consequuntur perspiciatis mollitia nam voluptates repudiandae optio.</p><p>Et et maiores sed blanditiis dignissimos omnis quas. Ea vitae quae sint voluptas eos quaerat aliquid voluptatem.</p><p>Consequuntur et magni expedita dolorem. Est accusantium nam provident modi. Et et ad laudantium vel. Molestias impedit doloremque in.</p><p>Libero quia nihil sit iusto laboriosam eum maxime. Ut commodi praesentium voluptatibus quasi est. Eos praesentium nobis vitae voluptas voluptas voluptas autem rem. Quibusdam perferendis aut ipsam rem ut ullam maxime.</p><p>Odit et est nostrum nihil et. Quo eius odio aperiam fugit. Harum neque et iusto ad beatae aut. Qui tempore doloremque ex alias.</p><p>Sunt et libero eius. Eum praesentium excepturi delectus quo non. Corporis placeat eveniet eveniet maxime.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(12, 1, 1, 'Perspiciatis mollitia deserunt debitis maxime maxime amet.', 'est-voluptatibus-recusandae-rerum-veniam-molestiae-nihil-omnis', NULL, 'Velit dolores itaque animi mollitia dolorem recusandae similique odit. Omnis cupiditate magnam quos dicta natus hic voluptatem repellat. Tempore non distinctio dignissimos in.', '<p>Incidunt perferendis quia qui sint. Dolor consequuntur repellendus quisquam. Reiciendis vitae qui facere. Esse aut deserunt maxime.</p><p>Sint vitae est impedit. Illum tempora consectetur illo. Sit occaecati aliquam iste sit. Quia quis deserunt deserunt qui eligendi. Corrupti cumque impedit consequatur cum ad.</p><p>Dignissimos impedit ea libero veritatis aut iusto necessitatibus. Voluptatem occaecati nihil molestias explicabo debitis ab temporibus veritatis. Tempora deserunt eos officiis perspiciatis et quis. Rerum dignissimos quibusdam at atque.</p><p>Ipsam illo qui nihil libero aliquid. Repudiandae ullam molestias facere incidunt laudantium et nihil. Ut consequatur deserunt voluptas numquam molestias nemo.</p><p>Ex minima corporis aut nisi. Distinctio aut sint sint officia sequi expedita. Dolores eaque a quis voluptas nam doloremque est.</p><p>Expedita ut qui porro aperiam. Quo explicabo repellendus dolor sequi voluptas accusantium eum. Sint ut temporibus vitae deserunt perspiciatis. Quasi doloribus aut sapiente explicabo.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(13, 1, 1, 'Iusto culpa voluptates exercitationem omnis eveniet ipsum.', 'ex-omnis-quas-aut-et', NULL, 'Fugit velit molestiae veritatis dolores laborum ad velit. Accusantium inventore qui saepe quas ea. Officiis necessitatibus aut et fuga eos necessitatibus. Nulla rem reprehenderit vel suscipit rerum nisi in. Rerum aperiam dolorem ullam quia qui sunt.', '<p>Nobis minima qui provident repudiandae. Eveniet distinctio ad expedita autem. Id nulla laudantium est quia expedita aut ut.</p><p>Ipsa voluptatem dolores earum harum aut. Beatae quae recusandae sit dignissimos quam. Perferendis facere consequatur cupiditate est repellendus nam. Ipsum ipsa minima cumque ea dolorem veritatis.</p><p>Dolore maiores exercitationem nam veniam. In sit possimus quo. Aspernatur odio fugiat porro sunt autem. Consequatur in enim nesciunt non.</p><p>Iste corrupti nobis atque. Magnam error occaecati excepturi repudiandae est sapiente. Quo ipsam praesentium eum autem minima voluptatem.</p><p>Pariatur sint molestiae rerum placeat voluptatem eligendi. Maiores unde non earum eos sed voluptatibus maiores harum.</p><p>Laboriosam quia facilis est et fugit qui dolore et. Ut et est veniam. Aliquam qui error accusamus voluptatibus quia qui est.</p><p>Accusantium repellendus nisi animi aut explicabo. Porro ut vel excepturi. Distinctio excepturi aut recusandae ut vitae ut ea.</p><p>Eius qui et aut nobis recusandae facilis. Aliquam eius aspernatur et a. Dolore dolor eum qui provident fugit vel et tempore. Nulla qui veniam eum laborum vitae reprehenderit. Et placeat vel quia voluptates non saepe.</p><p>Voluptatum repellat deleniti saepe deserunt facilis dolor. Eum est tempore ea est. Ut sequi consequatur nam est eum amet repudiandae.</p><p>Eaque ut eaque aut ut veniam voluptatem. Sed laborum id corporis consequuntur et. Repudiandae esse aut ad et velit vitae. Ullam adipisci praesentium qui tempore sapiente voluptatem.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(14, 3, 1, 'Voluptas ut optio delectus ut sint.', 'iure-odio-sunt-nostrum-ab', NULL, 'Doloribus officia aperiam aut deleniti eos voluptates dolorum. Occaecati et laborum dolores ut. Nemo expedita voluptas nulla quo quae sed. Expedita blanditiis quaerat qui nisi quis nemo quisquam. Quia ut repellendus sit aliquid animi fugiat aperiam.', '<p>Molestiae dolore voluptas ullam neque corrupti facilis. Quaerat eligendi qui magni voluptatibus atque. At omnis et fugiat iusto ipsa dicta facere rem. Praesentium impedit sit consequatur quae.</p><p>Sed amet et sunt hic quidem dolorum asperiores consequatur. Eos repellat sit molestiae exercitationem ullam. Voluptatem adipisci officiis modi adipisci officiis. Eaque quaerat quibusdam inventore. Nulla iusto reprehenderit libero explicabo.</p><p>Et necessitatibus doloribus nostrum voluptatem quia commodi harum. Fugiat rerum exercitationem magnam error qui. Recusandae suscipit enim repellendus et ut voluptate. Sed iste dicta tenetur aut harum nostrum dicta.</p><p>Quaerat voluptatem omnis adipisci tenetur reprehenderit. Alias debitis magni quaerat qui assumenda. Sit qui et rerum velit reiciendis perspiciatis.</p><p>Est in consequuntur sed omnis tenetur laborum. Iusto nihil corrupti omnis possimus explicabo. Ipsa ipsa non recusandae. Enim voluptas neque enim reprehenderit sunt exercitationem omnis ea.</p><p>Qui laborum aliquid odit maxime molestiae nobis reprehenderit. Laboriosam est rerum sapiente assumenda esse. Maxime natus possimus aut labore voluptas id.</p><p>Quae voluptatum enim ipsa. Corporis accusantium omnis qui veritatis necessitatibus iure inventore. Est nemo dignissimos sit voluptate modi.</p><p>Eveniet blanditiis necessitatibus minima architecto eveniet maxime iusto autem. In ea commodi in et perferendis. Eveniet iste sunt earum dolor et et. Commodi magnam maiores id quos hic qui aut.</p><p>Reiciendis iste iusto dolores nam ducimus eligendi aliquam quia. Ut ratione ea et.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(15, 3, 2, 'Adipisci culpa voluptas vel sequi rerum omnis ex error dolore.', 'voluptatem-aut-sint-consequatur-non-sit-doloremque-quibusdam-qui', NULL, 'Soluta consectetur voluptatem repellat qui. Totam et est deleniti est. Ex suscipit sint rerum odit commodi. Nobis architecto labore dolorum et autem quo. Repellat voluptatum magni quia modi veniam est dolor sint.', '<p>Aut minus in nihil nesciunt laudantium modi eos. Ex laudantium sit repudiandae atque. Non iusto molestiae voluptates qui occaecati a aspernatur.</p><p>Repellat deserunt ex aperiam dolorem nihil et animi iure. Id dolor numquam aut ipsa. Aperiam dolorum consequatur magni laudantium ex porro placeat.</p><p>Laboriosam dolores possimus ea molestiae. Deleniti qui rerum sunt. Saepe ex labore molestias nostrum nemo amet.</p><p>Odio odit cum dignissimos occaecati nulla quia. Repellat perspiciatis repudiandae similique non. Dolores asperiores error necessitatibus placeat. Eligendi impedit cum alias consectetur quae soluta quis. Delectus odit hic hic.</p><p>Facere voluptas voluptas laborum nobis ut. Est facere aut sint labore in. Rerum et optio id.</p><p>Aut repellendus culpa commodi blanditiis at quo occaecati. Recusandae hic cumque voluptas suscipit sint necessitatibus. Aliquam voluptatem fuga quos. Veritatis impedit est eius error soluta maiores sed. Dolorem rerum incidunt corrupti et est repellendus odit temporibus.</p><p>Asperiores nesciunt iste qui rerum illo. Vel et et esse recusandae ullam eveniet molestiae ducimus. Consequuntur magni eum harum corporis.</p><p>Iure aliquam deleniti aliquam quia alias. Assumenda soluta molestias sed quod. Accusamus culpa nam doloribus sint sit architecto.</p><p>Deleniti illo magni sapiente magnam quaerat. Et eligendi magni rerum minima minus et. Magnam voluptatem reprehenderit repellendus qui. Fuga blanditiis incidunt sit repudiandae libero aperiam repudiandae.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(16, 2, 3, 'Ad eius.', 'aut-minus-voluptatem-aut-beatae', NULL, 'Aut occaecati autem harum. Veniam velit id quae veritatis delectus odit. Qui unde in ut porro. Sunt ut dignissimos eius laudantium nulla laboriosam et.', '<p>Consequuntur sunt ex quod ab. Eos eos repudiandae error aut ad est vel.</p><p>Quia dolores at inventore natus. Dolores ad eius velit quae. Velit nobis eum dignissimos sed ipsa neque molestiae. Totam ipsa est eum earum est sint.</p><p>Ipsum repellat architecto numquam sunt qui eveniet eum consectetur. Nobis fugit id debitis. Ex aut qui quia ex magnam est.</p><p>Et voluptas nemo distinctio praesentium quasi ut. Similique ducimus sequi sit in ratione non non. Sed qui autem itaque saepe repellat.</p><p>Et amet numquam tenetur mollitia. Quidem dolorem nemo ratione dolor natus ipsa odit. Eum ut libero quam reprehenderit sed reiciendis. Aut rerum consequatur accusantium sequi sequi velit.</p><p>Dolorum autem adipisci modi ratione error non aut. Quasi aut temporibus facere consequatur nihil dolorum.</p><p>Dolorem omnis molestiae itaque nobis necessitatibus officia placeat. Voluptatem natus suscipit eligendi voluptas dicta hic architecto.</p><p>Soluta architecto harum libero qui. Molestiae nihil nihil et inventore perferendis adipisci. Ipsam velit est voluptatibus est voluptatum accusantium. Nihil nihil aut doloribus.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(17, 3, 3, 'Ipsam perferendis alias et fugiat ipsa.', 'nesciunt-hic-aut-alias-delectus-rerum', NULL, 'Qui saepe ab et impedit doloremque autem accusamus. Quam et a nobis voluptas. Nihil corporis doloremque quo voluptatem. Laborum dolorem cum iste est.', '<p>Repudiandae aperiam in ut qui sit eum. Eum dolor ut cum nostrum. Deleniti et consequatur iure non est. Enim consequatur voluptatum eum ipsam nihil.</p><p>Natus quia tempore dolor eos rerum perspiciatis et. Similique voluptatibus quia consequatur aut.</p><p>Et delectus rerum illo provident ut itaque. Facilis adipisci quae sequi et. Fugiat atque ratione dolor deleniti et. Fuga totam exercitationem explicabo et non quod incidunt.</p><p>Quia atque harum nostrum quas quae error. Ipsum necessitatibus sapiente magnam. Ut ad magni iure delectus.</p><p>Blanditiis adipisci aliquam nostrum nobis quia est inventore. Amet consequatur doloribus non esse. Sunt eaque qui modi ut molestias sed ut.</p><p>Itaque quae voluptatem excepturi voluptatem nesciunt non. Aut doloribus sed ex incidunt asperiores est et molestiae.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(18, 2, 1, 'Placeat qui.', 'animi-aut-deleniti-et-repellendus', NULL, 'Sint vel voluptas cupiditate dolores molestiae iste. Nihil rem est rerum distinctio quo. Alias praesentium et dignissimos ea reprehenderit.', '<p>Similique recusandae sunt voluptatum. Officiis ea omnis eius ad.</p><p>Voluptatem cum aspernatur ullam sequi voluptas quia corrupti. Animi a odit qui consequatur. Ipsam enim minima in et eligendi est et.</p><p>Illum perspiciatis praesentium dicta dignissimos dolor labore nemo voluptas. Ut et omnis autem asperiores itaque omnis. Accusamus molestias enim dicta sit illo minima. Quam esse deserunt ut cum rerum dicta.</p><p>Velit sed nulla non aut porro est. Dolores nihil aut error at ut ratione ullam. Dicta dolores non mollitia iure esse sed.</p><p>A saepe voluptatum cupiditate sequi quas. Est voluptatem esse minima molestiae facere illo. Itaque quo sit a quia dolor qui. Natus aut dolorum laborum laborum nostrum voluptatem qui.</p><p>Nisi necessitatibus et consequatur. Totam libero inventore nam vel facilis vel. Culpa sed necessitatibus quia.</p><p>Id qui qui asperiores aut deserunt. Consequatur magnam iusto facere qui eum. Beatae eveniet rerum distinctio et a voluptas officiis. Ut vitae quo provident animi magnam quo expedita.</p><p>Aut sunt dicta rem explicabo odit ut libero. Voluptates facilis ut sit laboriosam et et commodi molestias. Eaque ea expedita qui et qui eum est. Unde voluptates corrupti sit quis.</p><p>Sapiente repellat aut doloremque repudiandae tempora ea velit. Atque repellat harum atque nobis omnis reprehenderit. Porro eius harum sit unde voluptatum mollitia. Voluptatem eligendi fuga dolorum porro corrupti et odit ad.</p><p>Quia blanditiis ad est magnam blanditiis ad commodi. Et culpa suscipit sit aut iusto eum. Aut aliquid qui voluptatem reiciendis inventore velit molestiae.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(19, 1, 2, 'Expedita accusamus fugit blanditiis et.', 'enim-dolorum-consequatur-dolor', NULL, 'Numquam dolor sed enim aut non voluptatibus officia. Similique eos error praesentium libero facere iste non hic. Quae veritatis voluptatibus molestiae qui earum earum. Et impedit sunt praesentium labore sequi qui.', '<p>Molestias occaecati illo sint aut repudiandae nemo est temporibus. Dolor dignissimos provident voluptatem et repellat culpa odit saepe. Tenetur ex dolores explicabo asperiores error aliquid ipsa.</p><p>Consectetur saepe culpa voluptatem dignissimos. Ut enim quia eos porro est distinctio voluptates. Est et ad est natus sit.</p><p>Doloribus sequi porro vitae vitae suscipit eos quam. Aliquam tenetur fugiat dicta aut quas eveniet natus veritatis. Animi animi numquam dolor ea quibusdam. Et impedit aliquid sunt earum vero.</p><p>Qui voluptatem tenetur quae itaque sint. Saepe ut aut non enim rerum occaecati voluptatem.</p><p>Aut beatae beatae amet quae tenetur et nam. Porro sint quae et dolores voluptatem quasi in.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09'),
(20, 1, 3, 'Modi est dignissimos in eligendi atque illum.', 'veritatis-voluptate-delectus-reiciendis-repellendus-nihil-quia', NULL, 'Sequi aut rerum voluptatem rerum est et. Reprehenderit cum dolorem molestiae saepe optio vel unde. Maxime voluptatibus molestiae et veritatis voluptatibus sint. Quod perferendis in est itaque eligendi facere facere.', '<p>Molestias eum error consequatur et non. Sed nesciunt et dolor. Quia voluptas nihil officiis suscipit labore sunt. Sint quos veritatis deleniti non dicta perspiciatis quod.</p><p>Tempore fuga est et ratione omnis minima. At nihil et eum autem delectus id. Omnis impedit quia saepe sed ex iure cum.</p><p>Numquam iure qui iure. Veritatis quaerat quasi similique illum numquam. Omnis ea qui voluptatibus voluptates ratione.</p><p>Natus qui dolorem et rem sit rem tenetur. Corporis nostrum et et. Quasi autem magnam velit architecto non aspernatur aut.</p><p>Ipsum et delectus saepe magnam. Amet a odit vitae qui. In quo iusto nisi aliquid. Quia iste id ab quod at commodi adipisci.</p>', NULL, '2023-06-04 03:22:09', '2023-06-04 03:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Arief Aryudi Syidik', 'ariefaryudisyidik', 'ariefaryudisyidik@gmail.com', NULL, '$2y$10$cMWzNvq5MSu2e7QWzuKRP.fsbLSxcFvPZkzW8/lrjntMvtUOYkqaq', NULL, '2023-06-04 03:22:08', '2023-06-04 03:22:08', 1),
(2, 'Taufan Waluyo', 'najmudin.olga', 'aisyah.kurniawan@example.com', '2023-06-04 03:22:09', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xc97an9cc8lRrGFPd74BNGCQeFqjTDerMZ4XbV547T4eyt6vxADMSZbRtMYC', '2023-06-04 03:22:09', '2023-06-04 03:22:09', 0),
(3, 'Raharja Wijaya', 'dipa.permata', 'hendri.haryanti@example.net', '2023-06-04 03:22:09', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HqGJugF1ArMmSBK5ezAMT6Q85k3WxchTD9KC0bf70DngnBFBoEDrj2cLOFtU', '2023-06-04 03:22:09', '2023-06-04 03:22:09', 0),
(4, 'Gatra Waskita S.Kom', 'gangsa08', 'tania.sirait@example.org', '2023-06-04 03:22:09', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uknN6fyYck9NzciAfjHYgpSF8fc7CYJtNwAbEauqMlLYWoWtfysC2U05YIDA', '2023-06-04 03:22:09', '2023-06-04 03:22:09', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
