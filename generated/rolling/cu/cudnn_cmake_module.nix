{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    FindCUDNN-vendor_source-0rigsppgb6y7zwjln5dhklxzfs4f1aw8dyhbvk6sish9x7wbgyd6 = substituteSource {
      src = fetchurl {
        name = "FindCUDNN-vendor_source-0rigsppgb6y7zwjln5dhklxzfs4f1aw8dyhbvk6sish9x7wbgyd6-source";
        url = "https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
        hash = "sha256-pvm3+OkJ6qjN3Av6hrgKjmj3O52wFUsl/8eb9e7VL2Y=";
      };
      substitutions = [
      ];
    };
    cudnn_cmake_module-3eff7fe9a96110e4aa89965dc7f62c4287e50c80 = substituteSource {
      src = fetchgit {
        name = "cudnn_cmake_module-3eff7fe9a96110e4aa89965dc7f62c4287e50c80-source";
        url = "https://github.com/ros2-gbp/cudnn_cmake_module-release.git";
        rev = "3eff7fe9a96110e4aa89965dc7f62c4287e50c80";
        hash = "sha256-J6BqQzZzZMC0MVQ5oJCXgXu5fzoPlV+JErISeIuss6I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n    https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
          to = "DOWNLOAD file://${FindCUDNN-vendor_source-0rigsppgb6y7zwjln5dhklxzfs4f1aw8dyhbvk6sish9x7wbgyd6}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "cudnn_cmake_module";
  version = "0.0.1-5";
  src = sources.cudnn_cmake_module-3eff7fe9a96110e4aa89965dc7f62c4287e50c80;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Exports a CMake module to find cuDNN.";
  };
}
