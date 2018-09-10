<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../header.jsp"%>
<%-- 본문시작 couponForm.jsp --%>
<head>



<style rel="stylesheet">

.header {
  background-color: #17a9fa;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}



.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 100%;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #bfe1ff;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #bfe1ff;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: 'Name:';
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    margin:auto;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
/* mobile */

@media screen and (min-width:0px) and (max-width:1199px){
img{margin:auto;color:white;width:100%;font-size:2rem;text-align:center;margin-bottom:1rem}



</style>
</head>






<form class="cbp-mc-form">
  <div class="cbp-mc-column">
    <label for="first_name">First Name</label>
    <input type="text" id="first_name" name="first_name" placeholder="Jonathan">
    <label for="last_name">Last Name</label>
    <input type="text" id="last_name" name="last_name" placeholder="Doe">
    <label for="email">Email Address</label>
    <input type="text" id="email" name="email" placeholder="jon@doe.com">
    <label for="country">Country</label>
    <select id="country" name="country">
      <option>Choose a country</option>
      <option>France</option>
      <option>Italy</option>
      <option>Portugal</option>
    </select>
    <label for="bio">Biography</label>
    <textarea id="bio" name="bio"></textarea>
  </div>
  <div class="cbp-mc-column">
    <label for="phone">Phone Number</label>
    <input type="text" id="phone" name="phone" placeholder="+351 999 999">
    <label for="affiliations">Affiliations</label>
    <textarea id="affiliations" name="affiliations"></textarea>
    <label>Occupation</label>
    <select id="occupation" name="occupation">
      <option>Choose an occupation</option>
      <option>Web Designer</option>
      <option>Web Developer</option>
      <option>Hybrid</option>
    </select>
    <label for="cat_name">Cat's name</label>
    <input type="text" id="cat_name" name="cat_name" placeholder="Kitty">
    <label for="gagdet">Favorite Gadget</label>
    <input type="text" id="gagdet" name="gagdet" placeholder="Annoy-a-tron">
  </div>
  <div class="cbp-mc-column">
    <label>Type of Talent</label>
    <select id="talent" name="talent">
      <option>Choose a talent</option>
      <option>Ninja silence</option>
      <option>Sumo power</option>
      <option>Samurai precision</option>
    </select>
  <label for="drink">Favorite Drink</label>
    <input type="text" id="drink" name="drink" placeholder="Green Tea">
    <label for="power">Special power</label>
    <input type="text" id="power" name="power" placeholder="Anti-gravity">
    <label for="weapon">Weapon of choice</label>
    <input type="weapon" id="weapon" name="weapon" placeholder="Lightsaber">
    <label for="comments">Comments</label>
    <textarea id="comments" name="comments"></textarea> 
  </div>
  <div class="cbp-mc-submit-wrap">
    <input class="cbp-mc-submit" type="submit" value="등록" />
    <input class="cbp-mc-submit" type="reset" value="다시입력" />
    <input class="cbp-mc-submit" type="button" value="취소" onclick="javascript:history.back()"/>
  </div>
</form>

<%-- 본문끝 --%>
<%@ include file="../footer.jsp"%>