{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcpputils = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "114da6d318c5254ae3ddad8eb29006411796ca8b";
        hash = "sha256-A4fgkUrENQpRAgy7AiiW8WK1huoOIvTvoYr4bKTwQK0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcpputils";
  version = "2.11.0-2";
  src = sources.rcpputils;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing utility code for C++.";
  };
}
