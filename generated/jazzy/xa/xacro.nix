{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_index_python,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    xacro-cf73bd6240c8b19a819681498f671f0c3ca80758 = substituteSource {
      src = fetchgit {
        name = "xacro-cf73bd6240c8b19a819681498f671f0c3ca80758-source";
        url = "https://github.com/ros2-gbp/xacro-release.git";
        rev = "cf73bd6240c8b19a819681498f671f0c3ca80758";
        hash = "sha256-+93WLiVZewjzhzlEzSTG/zTjYx3+ri7uv+d7nO1xdX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "xacro";
  version = "2.0.11-2";
  src = sources.xacro-cf73bd6240c8b19a819681498f671f0c3ca80758;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Xacro (XML Macros) Xacro is an XML macro language. With xacro, you can construct shorter and more readable XML files by using macros that expand to larger XML expressions.";
  };
}
