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
buildAmentCmakePackage (finalAttrs: {
  pname = "fastrtps_cmake_module";
  version = "3.7.1-1";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "d60583f2349cf8576aa0b3dc395c07f55f1eda91";
        hash = "sha256-hAa+hHhSO81PH2tm3MAJfnRSxpT1ROZCedSCXsunW8E=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
