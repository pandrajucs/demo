pipeline{
agent any
environment {
    PATH = "${PATH}:${getTerraformPath()}"
}

stages{
stage('terraform init'){
steps{
sh "terraform init"
sh "terraform apply --auto-approve"
    }
  }
 }
}
def getTerraformPath(){
 def tfHome = tool name: 'terraform-11', type: 'terraform'
 return tfHome
}
