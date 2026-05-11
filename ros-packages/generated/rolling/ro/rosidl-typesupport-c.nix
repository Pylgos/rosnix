{
  ament-cmake-core,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros-core,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_c";
  version = "3.5.0-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "28ecf1737c64a1c1dbd49033f58804af50591f62";
        hash = "sha256-hrgHJxT+n6+s9zRy2YQT3nLPoKp2OdnaD0wsJKrgNWs=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
