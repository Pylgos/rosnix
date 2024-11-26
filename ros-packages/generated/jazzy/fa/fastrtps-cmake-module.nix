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
  version = "3.6.0-2";
  src = finalAttrs.passthru.sources."fastrtps_cmake_module";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fastrtps_cmake_module" = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "d3265cdbcaad3096098474edb966fd17eb5a977f";
        hash = "sha256-CMvgUlOB5CpgyTkKXPsg5gTBnHHJWz1DLOwjQRe/UDs=";
      };
    };
  });
  meta = {
    description = "Provide CMake module to find eProsima FastRTPS.";
  };
})
