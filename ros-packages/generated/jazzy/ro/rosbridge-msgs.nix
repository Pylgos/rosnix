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
  version = "2.5.0-1";
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
        rev = "2a6e55c49245aade0175e1fd02dc57cde66562f1";
        hash = "sha256-zP9r0TKUlgkF85Mcin7jKpCNw8NmutLCS/txTZPSk58=";
      };
    };
  });
  meta = {
    description = "Interface definitions for the rosbridge library.";
  };
})
