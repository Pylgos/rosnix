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
  pname = "std_srvs";
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."std_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "std_srvs" = substituteSource {
      src = fetchgit {
        name = "std_srvs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "7f20445273f1b5870b7ec7f1f6ef5dc384e1ebc8";
        hash = "sha256-sznCjU7txe3LiPgEt64G8WWKFmThbpli34RUE7GikLk=";
      };
    };
  });
  meta = {
    description = "A package containing some standard service definitions.";
  };
})
