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
  version = "3.6.3-1";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "95a1206dfe2e89a3a7ea994656858050a969d6c8";
        hash = "sha256-SfIg6otC6eyRV+xHuO4u4fIlOZgX1hrmTBr46Hfx27c=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
