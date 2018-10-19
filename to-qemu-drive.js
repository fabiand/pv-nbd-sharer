pvSpecFile = arguments[0]

pv = JSON.parse(read(pvSpecFile))
iscsi = pv.spec.iscsi

url = "iscsi://" + iscsi.targetPortal + "/" + iscsi.iqn + "/" + iscsi.lun
print(url)
