﻿<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="checkout_settlement.aspx.cs" Inherits="CloudIpspSamples.CheckoutSettlement" %>
<%@ Import Namespace="System.ComponentModel" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<head runat="server">
    <title>Checkout</title>
</head>
<body>
<div class="container">
    <% if (Data != null)
       { %>
        <h2>Order Response data</h2>
        <table class="table table-sm">
            <% foreach (PropertyDescriptor descriptor in TypeDescriptor.GetProperties(Data))
               { %>
                <tr>
                    <td><% Response.Write(descriptor.Name); %></td>
                    <td><% Response.Write(descriptor.GetValue(Data)); %></td>
                </tr>
            <% } %>
        </table>
    <% }
       else if (DataError != null)
       { %>
        <h2>Checkout Error!<br/>Request ID: <b><% Response.Write(RequestId); %></b></h2>
        <h5>Error message: <b><% Response.Write(DataError); %></b></h5>
    <% }
       else
       { %>
        <form runat="server">
            <fieldset>
                <legend>Order Details</legend>
                <div class="form-group">
                    <label for="order_id">Order ID: </label>
                    <input id="order_id" class="form-control" type="text" name="order_id" value="<%
                                                                                                     if (Request.Form["order_id"] == null)
                                                                                                     {
                                                                                                         Response.Write(Guid.NewGuid().ToString());
                                                                                                     }
                                                                                                     else
                                                                                                     {
                                                                                                         Response.Write(Request.Form["order_id"]);
                                                                                                     }
                                                                                                 %>"/>

                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input id="amount" class="form-control" type="number" name="amount" value="<%
                                                                                                   if (Request.Form["amount"] == null)
                                                                                                   {
                                                                                                       Response.Write("100");
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                       Response.Write(Request.Form["amount"]);
                                                                                                   }
                                                                                               %>"/>
                </div>
            </fieldset>
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" runat="server"/>
        </form>
    <% } %>
</div>
</body>
</html>