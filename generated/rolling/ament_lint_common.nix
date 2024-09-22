{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_export_dependencies,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
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
    ament_lint_common = substituteSource {
      src = fetchgit {
        name = "ament_lint_common-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "dedfb62b9b8f8d46373155c4e1694665f3ba1de2";
        hash = "sha256-Aw/vW4kaCH0tIR0LxDdXwJJ+BWWKVGmIcInxfqgikeI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_common";
  version = "0.18.1-1";
  src = sources.ament_lint_common;
  nativeBuildInputs = [ ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_copyright ament_cmake_core ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake_export_dependencies ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_copyright ament_cmake_core ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The list of commonly used linters in the ament build system in CMake.";
  };
}
