class Header extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `<div class="topnav" id="myTopnav">
                              <nav>
                              <a href="Dashboard.aspx" class="active">Dashboard</a>
                              <a href="./Receipt.aspx">Receipts</a>
                              <a href="Customers.aspx">Customers</a>
                              <div class="dropdown">
                                <button class="dropbtn">Dropdown
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="#">Link 1</a>
                                    <a href="#">Link 2</a>
                                    <a href="#">Link 3</a>
                                </div>
                              </div>
                            <a href="#about">About</a>
                            <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
                            </nav>
                          </div> `;
    }
}

customElements.define("header-template", Header);