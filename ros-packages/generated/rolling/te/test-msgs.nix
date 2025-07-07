{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  test-interface-files,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "test_msgs";
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime test-interface-files ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime test-interface-files ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "test_msgs" = substituteSource {
      src = fetchgit {
        name = "test_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "58125562f8f6b2922ae9f0fbed085e11978c3413";
        hash = "sha256-wfDA4PnvLVhJOM2xT8MVNTpYCcuvVPxO+vUuFvuUnl4=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
