{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "25c45d3539dc60db9dd544f403adf606798cd8cc";
        hash = "sha256-bCoNsGJXFR/5/QRx4p3MDQUZaSGsHe7JpKSpUGSSE6Y=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "fastrtps_cmake_module";
  version = "3.7.0-1";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
