{
  ament-cmake-auto,
  ament-lint-auto,
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
  pname = "autoware_adapi_version_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_version_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_version_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_version_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "6d49cc22c713da5ecf0601ead8f9111ff70b7bd6";
        hash = "sha256-NgmJaOTPpTaLzuKySD64mVynkUKIS1hPwtV4ebCPdfs=";
      };
    };
  });
  meta = {
    description = "The Autoware AD API version interfaces";
  };
})
