<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

<div id="smalltable">	
<ul id="menu">
  <h2><strong>Details</strong></h2>
</ul>

&nbsp;&nbsp;

<table width="600" cellspacing="5">
  <tr>
    <td width="464">Case ID :</td>
    <td width="411"><form id="form1" name="form1" method="post" action="">
      <label>
        <input type="text" name="textfield" id="textfield" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Patient name :</td>
    <td><form id="form2" name="form2" method="post" action="">
      <label>
        <input type="text" name="textfield2" id="textfield2" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Referral Date :</td>
    <td><form id="form3" name="form3" method="post" action="">
      <label>
        <input type="text" name="textfield3" id="textfield3" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Referral time :</td>
    <td><form id="form4" name="form4" method="post" action="">
      <label>
        <input type="text" name="textfield4" id="textfield4" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Case status :</td>
    <td><form id="form5" name="form5" method="post" action="">
      <label>
        <input type="text" name="textfield5" id="textfield5" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Referred by :</td>
    <td><form id="form6" name="form6" method="post" action="">
      <label>
        <input type="text" name="textfield6" id="textfield6" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Referred from :</td>
    <td><form id="form7" name="form7" method="post" action="">
      <label>
        <input type="text" name="textfield7" id="textfield7" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Reporting date and time :</td>
    <td><form id="form8" name="form8" method="post" action="">
      <label>
        <input type="text" name="textfield8" id="textfield8" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Discharge date and time :</td>
    <td><form id="form9" name="form9" method="post" action="">
      <label>
        <input type="text" name="textfield9" id="textfield9" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Treatment received :</td>
    <td><form id="form10" name="form10" method="post" action="">
      <label>
        <input type="text" name="textfield10" id="textfield10" />
      </label>
    </form></td>
  </tr>
  <tr>
    <td>Action taken :</td>
    <td><form id="form11" name="form11" method="post" action="">
      <label>
        <input type="text" name="textfield11" id="textfield11" />
      </label>
    </form></td>
  </tr>
</table>

<p><div>
    <p>
      <input name="submit" type="submit" value="Submit" />
      <input type="reset" name="Reset" id="button" value="Reset" />
    </p>
    <div id="next" align="center"><input name="Next" type="button" value="Next" /></div>
</div> 
         
  </p>
        		
</div>

<p>abc </p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="smalltable">
  <p>abc</p>
  <div align="justify">
    <table width="300" border="2" cellspacing="3" align="center">
      <tr>
        <td width="163">Observation</td>
        <td width="116">Value</td>
      </tr>
      <tr>
        <td>Blood group :</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>
            Weight  :
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
   <input name="submit" type="submit" value="Save" align="middle"/>
      <input type="reset" name="Reset" id="button" value="Edit" align="middle"/>
      
  <div id="next" align="center"><input name="Next" type="button" value="Print" /></div>
</div>

<%@ include file="/WEB-INF/template/footer.jsp"%>