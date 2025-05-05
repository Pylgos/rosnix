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
  pname = "rcss3d_agent_msgs";
  version = "0.4.1-3";
  src = finalAttrs.passthru.sources."rcss3d_agent_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent_msgs" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "f77c39ad9b2617e0ae8097535ecdea2e6720aae5";
        hash = "sha256-AN/eyLroQDeZjI/JosPYI5tZHhbJn0jP1d8D3wjuN54=";
      };
    };
  });
  meta = {
    description = "Custom messages for communicating with rcss3d_agent";
  };
})
