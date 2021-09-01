# work from a clean tf directory (no state)
rm -rf /tmp/test-terraform
mkdir /tmp/test-terraform
cp ./*.tf /tmp/test-terraform
cd /tmp/test-terraform
# use test AWS
cp /challenges/terraform/provider.tf provider.tf
sed -i 's/moto/moto-test/g' provider.tf
