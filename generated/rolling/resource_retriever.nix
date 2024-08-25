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
  python3Packages,
  python_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    resource_retriever = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "97e308d39d07457b1d2ef7a751b5954e683e736c";
        hash = "sha256-+42HRlTp4jWYQMljcY2um/rlmb5jlk34Q+45GOBWs9w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "resource_retriever";
  version = "3.5.1-1";
  src = sources.resource_retriever;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp ament_index_python libcurl_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common python3Packages.pytest python_cmake_module ];
  missingDependencies = [  ];
  meta = {
    description = "This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory. The package:// url for ros packages is translated into a local file:// url. The resourse retriever was initially designed to load mesh files into memory, but it can be used for any type of data. The resource retriever is based on the the libcurl library.";
  };
}
