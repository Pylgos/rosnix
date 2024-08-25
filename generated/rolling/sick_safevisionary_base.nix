{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_base = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_base-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_base-release.git";
        rev = "5687f278b282b28841f11c65d1bd77d9d69bb9d6";
        hash = "sha256-EMtEy8XLykxcLHYCPgk6Ralivtfddx0U4aPIsdnxSlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_base";
  version = "1.0.1-2";
  src = sources.sick_safevisionary_base;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides the basic hardware interface to the SICK Safevisionary sensor";
  };
}
