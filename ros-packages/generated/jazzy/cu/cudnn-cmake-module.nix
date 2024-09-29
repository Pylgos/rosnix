{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "cudnn_cmake_module" = substituteSource {
      src = fetchgit {
        name = "cudnn_cmake_module-source";
        url = "https://github.com/ros2-gbp/cudnn_cmake_module-release.git";
        rev = "de4d4f9f0b0abe550eb0594bb9cea11ceeb536e7";
        hash = "sha256-J6BqQzZzZMC0MVQ5oJCXgXu5fzoPlV+JErISeIuss6I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n    https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
          to = "DOWNLOAD file://${sources."cudnn_cmake_module/FindCUDNN"}";
        }
      ];
    };
    "cudnn_cmake_module/FindCUDNN" = substituteSource {
      src = fetchurl {
        name = "FindCUDNN-source";
        url = "https://raw.githubusercontent.com/opencv/opencv/0677f3e21cc3379e68d517dc80a8c12e5df0c608/cmake/FindCUDNN.cmake";
        hash = "sha256-pvm3+OkJ6qjN3Av6hrgKjmj3O52wFUsl/8eb9e7VL2Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "cudnn-cmake-module";
  version = "0.0.1-6";
  src = sources."cudnn_cmake_module";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Exports a CMake module to find cuDNN.";
  };
}
