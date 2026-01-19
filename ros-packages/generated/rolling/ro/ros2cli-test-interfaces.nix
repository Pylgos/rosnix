{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2cli_test_interfaces";
  version = "0.40.4-1";
  src = finalAttrs.passthru.sources."ros2cli_test_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2cli_test_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "045cca58d11b0a57d8dd455426beb2f3ffa5e204";
        hash = "sha256-UtEGjAC+4CoXJpjg4/jsXFPFr7Ydlc1vWCcdnerr4h4=";
      };
    };
  });
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
})
