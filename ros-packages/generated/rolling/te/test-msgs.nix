{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-mypy,
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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."test_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime test-interface-files ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-typing-extensions" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime test-interface-files ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-typing-extensions" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-mypy ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "test_msgs" = substituteSource {
      src = fetchgit {
        name = "test_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "c09d8c22abfb5e26da82b72a25aa1c6d6b19e773";
        hash = "sha256-/Z/jbnc5NR870+2ho4swQldcEeKzrE/1cwV3/KB8q+8=";
      };
    };
  });
  meta = {
    description = "A package containing message definitions and fixtures used exclusively for testing purposes.";
  };
})
