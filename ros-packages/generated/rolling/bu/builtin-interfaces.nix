{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "builtin_interfaces";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."builtin_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "builtin_interfaces" = substituteSource {
        src = fetchgit {
          name = "builtin_interfaces-source";
          url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
          rev = "dc2e3169ea022057f2e85e3f33c98980483911eb";
          hash = "sha256-qcLKGVbZJHzSuOCcJCqOWtju1X2JcXHPDFgGShM1J7s=";
        };
      };
    });
  };
  meta = {
    description = "A package containing message and service definitions for types defined in the OMG IDL Platform Specific Model.";
  };
})
