{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
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
    "tensorrt_cmake_module" = substituteSource {
      src = fetchgit {
        name = "tensorrt_cmake_module-source";
        url = "https://github.com/ros2-gbp/tensorrt_cmake_module-release.git";
        rev = "24346a131e0ffd199c767dd1582fdef9af42e19c";
        hash = "sha256-S620gK89qsxhq1mo2yFSZCD1LP45mJBLXJbCTiT5VZk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tensorrt_cmake_module";
  version = "0.0.3-4";
  src = sources."tensorrt_cmake_module";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Exports a CMake module to find TensorRT.";
  };
}