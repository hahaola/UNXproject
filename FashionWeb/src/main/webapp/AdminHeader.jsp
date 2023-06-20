<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="img/logoGoodTaste.png" alt="" width="35" class="d-inline-block align-text-top">
        ADMIN PAGE
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
        <div class="nav nav-tabs" id="tab-nav" roll="tablist">
            <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
                Account
            </button>

            <a href="AdminShowProduct?page=1" class="nav-link">Product</a>
            <a href="AdminShowCategory" class="nav-link">Category</a>

            <button class="nav-link" id="nav-bill-tab" data-bs-toggle="tab" data-bs-target="#nav-bill" type="button" role="tab" aria-controls="nav-bill" aria-selected="false">
                Bill Order
            </button>
        </div>
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Hello ${NAME.username}
                </a>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                    <li><a class="dropdown-item" href="AdminUpdateAccount?accID=${NAME.accID}">Update Account</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li class="nav-item">
                        <a class="dropdown-item" href="HomeServlet">Home Page</a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a  href="AdminAddNewAccount.jsp" class="dropdown-item">Create New Account</a></li>
                    <li><a  href="AdminAddNewProduct.jsp" class="dropdown-item">Add New Product</a></li>
                    <li><a  href="AdminAddCategory.jsp" class="dropdown-item">Add New Category</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>