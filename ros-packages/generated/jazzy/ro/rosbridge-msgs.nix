{
  ament-cmake,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbridge_msgs";
  version = "2.4.2-1";
  src = finalAttrs.passthru.sources."rosbridge_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosbridge_msgs" = substituteSource {
      src = fetchgit {
        name = "rosbridge_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "93d718a776cf335adc663b297032fa322ef82cec";
        hash = "sha256-kcFa4F7kQ7Kda5N3WOsGNFbrRbQJfeMTTd/Od6mWkfE=";
      };
    };
  });
  meta = {
    description = "Interface definitions for the rosbridge library.";
  };
})
