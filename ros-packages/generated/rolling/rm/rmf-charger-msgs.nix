{
  ament-cmake,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_charger_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_charger_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_charger_msgs" = substituteSource {
        src = fetchgit {
          name = "rmf_charger_msgs-source";
          url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
          rev = "bedf8e1266f4c9737cdcab974c3ecba6118cb0a8";
          hash = "sha256-4yYp6f8sB1pWOCMf0lafsewhx0hYlSBaWMNqDQd8xns=";
        };
      };
    });
  };
  meta = {
    description = "This package contains messages regarding charging and discharging";
  };
})
