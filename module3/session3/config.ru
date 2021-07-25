require_relative "app/controllers/categories_controller"
require_relative "app/controllers/category_items_controller"
require_relative "app/controllers/items_controller"

use CategoriesController
use CategoryItemsController
run ItemsController
