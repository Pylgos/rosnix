{
  ament-cmake,
  ament-cmake-copyright,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_interfaces";
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."auto_apms_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_interfaces" = substituteSource {
      src = fetchgit {
        name = "auto_apms_interfaces-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "6e1fd25ecbe676b815a6a130ee91407abd71ac1f";
        hash = "sha256-4ZwOWtpdZissFXztQMnbPIQ4f9RK2RzdFG3qft5Ayt0=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for AutoAPMS";
  };
})
