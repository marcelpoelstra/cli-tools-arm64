cd docker
cd mp4split
echo "building local docker image mp4split..."
docker build . -t mp4split:latest
echo "complete"
cd cpix_verify
echo "building local docker image cpix_verify..."
docker build . -t cpix_verify:latest
echo "complete"
cd ../manifest_edit
echo "building local docker image manifest_edit..."
docker build . -t manifest_edit:latest
echo "complete"
cd ../push_input_stream
echo "building local docker image push_input_stream..."
docker build . -t push_input_stream:latest
echo "complete"
cd ../unified_capture
echo "building local docker image unified_capture..."
docker build . -t unified_capture:latest
echo "complete"
cd ../unified_remix 
echo "building local docker image unified_capture..."
docker build . -t unified_remix:latest
echo "complete"
echo "building docker images complete"