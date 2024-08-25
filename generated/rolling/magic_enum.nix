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
    magic_enum = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "c781e21940b8046fa81dace2fe4afb291bbbcbec";
        hash = "sha256-maDyPAh57gP3vZwB34IYIwVCnmcDwi1msh639mFMdRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "magic_enum";
  version = "0.9.6-1";
  src = sources.magic_enum;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Static reflection for enums (to string, from string, iteration) for modern C++, work with any enum type without any macro or boilerplate code";
  };
}
