1- /v2/coverages?partner=KIND_DE&validDate=2023-07-27&name=itemInsuredCategory&value=(seleccionado del partner Configuration en el primer paso)

Obtienes un array de product[]

2- /v2/contract-lengths?productId[]&productId[]...
3- /v2products?productId[]&productId[]... Frontend tiene que calcular los distintos premiumTypes de todos los products devueltos a esto se le llama PaymentFrequency
4- /v2/billing-options??productId[]&productId[]... Frontend tiene que calcular los distintos billingMethods devueltos y a esto se le llama paymentMethod