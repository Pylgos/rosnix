{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl_vendor,
  python_cmake_module,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    resource_retriever-b8d030d40febf9e5b6a338ab78471e57682d3c4a = substituteSource {
      src = fetchgit {
        name = "resource_retriever-b8d030d40febf9e5b6a338ab78471e57682d3c4a-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "b8d030d40febf9e5b6a338ab78471e57682d3c4a";
        hash = "sha256-VwQaQ1RxDY6NO5ZZk4CdkeTkBC60WhAP+nBKX7z/DZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "resource_retriever";
  version = "3.4.3-1";
  src = sources.resource_retriever-b8d030d40febf9e5b6a338ab78471e57682d3c4a;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp ament_index_python libcurl_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common python_cmake_module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory. The package:// url for ros packages is translated into a local file:// url. The resourse retriever was initially designed to load mesh files into memory, but it can be used for any type of data. The resource retriever is based on the the libcurl library.";
  };
}
