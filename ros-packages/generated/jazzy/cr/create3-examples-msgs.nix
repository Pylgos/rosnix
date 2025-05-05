{
  action-msgs,
  ament-cmake,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_examples_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_examples_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create3_examples_msgs" = substituteSource {
      src = fetchgit {
        name = "create3_examples_msgs-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "343985ffea7221e8595e54dc0606c050ab40f856";
        hash = "sha256-ndDXU8l0nR534hkAQXnYooU2if1jaAC2/7yEotF5CiQ=";
      };
    };
  });
  meta = {
    description = "Package containing action, message and service definitions used by the iRobot(R) Create(R) 3 examples";
  };
})
