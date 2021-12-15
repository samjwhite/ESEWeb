<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="ESEWeb.NewCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Customer</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server" class="needs-validation" > <!--id="newEquipmentForm"-->
        <div>
<h2 class="text-primary">Create New Customer</h2>

<div class="container">
<main>
<div id="alert"></div>
<div class="col-md-7 col-lg-8">
  <h4 class="mb-3">New Customer</h4>
  
    <div class="row g-3">
      <div class="col-sm-6">
        <label for="first-name" class="form-label">Customer's First Name<span title="First Name: A customer's individual name."></span> </label>
        <input type="text" class="form-control" id="first-name" placeholder="Ex: John" value=""/>
        <div class="invalid-feedback">
          Valid customer name is required.
        </div>
      </div>

      <div class="col-sm-6">
        <label for="last-name" class="form-label">Customer's Last Name<span title="Last Name: A customer's family name."> </span></label>
        <input type="text" class="form-control" id="last-name" placeholder="Ex: McClain" value="" />
        <div class="invalid-feedback">
          Valid last name is required.
        </div>
      </div>

      <div class="col-sm-12">
        <label for="address" class="form-label">Street Address<span title="Street Address: The name of the street and house/apartment number of a customer."> </span></label>
        <input type="text" class="form-control" id="address" placeholder="Ex: 111 Church St." value="" />
        <div class="invalid-feedback">
          Valid address is required.
        </div>
      </div>

      <div class="col-sm-7">
        <label for="city" class="form-label">City<span title="City: The City in which a customer lives in."> </span></label>
        <input type="text" class="form-control" id="city" placeholder="Ex: St. Catherines" value=""/>
        <div class="invalid-feedback">
          City is required.
        </div>
      </div>

      <div class="col-sm-5">
        <label for="province" class="form-label">Province<span title="Province: The Province of Canada a customer lives in."> </span></label>
        
        <select class="form-select form-select-sm" id="province" aria-label=".form-select-sm example">
            <option selected>Select One...</option>
            <option value="AB">AB</option>
            <option value="BC">BC</option>
            <option value="MB">MB</option>
            <option value="NB">NB</option>
            <option value="NL">NL</option>
            <option value="NS">NS</option>
            <option value="ON">ON</option>
            <option value="PE">PE</option>
            <option value="QC">QC</option>
            <option value="SK">SK</option>
        </select>
      </div>

      <div class="col-sm-6">
        <label for="phone" class="form-label">Phone Number<span title="Phone Number: A customer's 10 digit phone number."> </span></label>
        <input type="text" class="form-control" id="phone" placeholder="Ex: (905)123-4567" value="" />
        <div class="invalid-feedback">
          Valid Phone Number is required.
        </div>
      </div>

      <div class="col-sm-6">
        <label for="email" class="form-label">Email<span title="Email: A customer's email address."></span></label>
        <input type="text" class="form-control" id="email" placeholder="Ex: info@mail.com" value="" />
        <div class="invalid-feedback">
          Valid Email is required.
        </div>
    </div>
    </div>
    <hr class="my-4"/>
    
    <button class="w-100 btn btn-primary btn-lg" type="submit" id="submit-btn">Create Customer</button>
    
    <button class="my-3 w-100 btn btn-outline-danger btn-lg" id="btnClear" type="reset">Clear Form</button>


</div>

</main>





    </div>
        </div>
    </form>
</body>
</html>
