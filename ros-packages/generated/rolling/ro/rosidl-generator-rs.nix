{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-generator-c,
  rosidl-parser,
  rosidl-pycommon,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_rs";
  version = "0.4.11-1";
  src = finalAttrs.passthru.sources."rosidl_generator_rs";
  propagatedNativeBuildInputs = [ ament-cmake ros-environment rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-typesupport-c rosidl-typesupport-interface ];
  propagatedBuildInputs = [ ament-cmake ros-environment rosidl-generator-c rosidl-parser rosidl-pycommon rosidl-typesupport-c rosidl-typesupport-interface ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-generator-c rosidl-pycommon ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_rs" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_rs-source";
        url = "https://github.com/ros2-gbp/rosidl_rust-release.git";
        rev = "cd6e4c29dafdf4f39b0f0e0825ac1a93f9ff0a3e";
        hash = "sha256-DrGzwPQwwVpjyra+abQDpXJy/sdMH0x3tbJwJWpzeVA=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Rust.";
  };
})
