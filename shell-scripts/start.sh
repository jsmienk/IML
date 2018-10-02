echo "*************************************************************************************************"
echo "* Starting the server on http://[IP_or_localhost]:8888 to work with the Jupyter notebook server *"
echo "* Password: iml                                                                                 *"
echo "*************************************************************************************************"

docker run -p 8888:8888 -v "$(pwd)":/assignment -it evertduipmans/saxion-iml