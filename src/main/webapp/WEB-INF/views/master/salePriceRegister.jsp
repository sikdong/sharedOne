<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
    .container{
        width: 200px;
        height: 300px;
        display: contents;
    }
    .insert-body {
        max-width: 700px;
    }
    .buyer-insert-header{
        width: 100%;
        height: 100%;
        text-align: center;
        margin-bottom: 30px;
        margin-top: 30px;
    }
    .form-name{
        text-align: right;
    }
    .form-text{
        float: left;
        text-align: left;
    }
    #buyerName{
        -webkit-appearance: button;
    }
    .rowdiv{
        justify-content: space-around;
    }
    .col-form-label{
        font-weight: 600;
    }
</style>
<body>   
    <div class="insert-body mt-5 ">
        <div class="container-md">
            <div class="row">
                <div class="col mt-1">
                    <div class="mb-4">
                        <h1 style="font-size: 24px; font-weight:600">판매가격 등록</h1>
                    </div>					
                    <hr class="line" style="border: solid 1px #000" />
                    </div>
                    <div class="container-sm content-size">
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputCode" class="col-3 col-form-label">제품 코드</label>
                            <div class="col-sm-5">
                                <input id="productCode" type="text" class="form-control" placeholder="제품코드를 입력하세요."/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputBuyerName" class="col-3 col-form-label">바이어 코드</label>
                            <div class="col-sm-5">
                                <form>
                                    <select id="buyerName" name="type" class="form-control" style="padding-left: 8px;" >
                                      <option value="none">바이어 선택</option>
                                      <option value="ATX">ATX OILFIELD</option>
                                      <option value="BAO">바오 철강</option>
                                      <option value="GEL">GELTEX</option>
                                      <option value="KVV">한국밸브</option>
                                      <option value="MOB">MOONBELT</option>
                                    </select>
                                  </form>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputSalePrice" class="col-3 col-form-label">판매가격</label>
                            <div class="col-sm-5">
                                <input id="salePrice" onkeyup="inputNumberFormat(this);" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"type="text" class="form-control" placeholder="판매가격을 입력하세요."/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceDiscount" class="col-3 col-form-label">할인율</label>
                            <div class="col-sm-5">
                                <input id="priceDiscount" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" class="form-control" placeholder="할인율을 입력하세요."/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceStartDate" class="col-3 col-form-label">시작일</label>
                            <div class="col-sm-5">
                                <input id="priceStartDate" type="date" class="form-control"/>
                            </div>
                        </div>
                        <div class="mb-2 row mt-2 rowdiv">
                            <label for="inputPriceEndDate" class="col-3 col-form-label">종료일</label>
                            <div class="col-sm-5">
                                <input id="priceEndDate" type="date" class="form-control"/>
                            </div>
                        </div>                        
                    </div>
                <hr />
                <div>
                    <button class="btn" style="float: right; font-size: 15px; font-weight: 600; width: 60px; height: 30px; color: white; border: none; border-radius: 5px; background: #c7c9c2;"> 등록 </button>
                </div>
              
            </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script>
        function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        } 
        
        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }
        
        function inputOnlyNumberFormat(obj) {
            obj.value = onlynumber(uncomma(obj.value));
        }
        
        function onlynumber(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
        }
    </script>

</body>
</html>