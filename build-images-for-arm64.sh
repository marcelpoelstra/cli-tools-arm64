cd docker
cd mp4split-arm64
echo "building local docker image mp4split..."
docker build . -t mp4split-arm64:latest
echo "complete"
cd cpix_verify-arm64
echo "building local docker image cpix_verify..."
docker build . -t cpix_verify-arm64:latest
echo "complete"
cd ../manifest_edit-arm64
echo "building local docker image manifest_edit..."
docker build . -t manifest_edit-arm64:latest
echo "complete"
cd ../push_input_stream-arm64
echo "building local docker image push_input_stream..."
docker build . -t push_input_stream-arm64:latest
echo "complete"
cd ../unified_capture-arm64
echo "building local docker image unified_capture..."
docker build . -t unified_capture-arm64:latest
echo "complete"
cd ../unified_remix-arm64
echo "building local docker image unified_capture..."
docker build . -t unified_remix-arm64:latest
echo "complete"
echo "building docker images complete"